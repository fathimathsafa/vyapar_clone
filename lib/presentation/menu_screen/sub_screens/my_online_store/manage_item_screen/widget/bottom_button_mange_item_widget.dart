import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class BottomButtonManageItem extends StatelessWidget {
  BottomButtonManageItem({super.key, this.onClickSaveNew, this.onClickSave,this.saveBackGroundClr,this.isOnlyTwoButtons});
  final Color? saveBackGroundClr;
  final bool? isOnlyTwoButtons;

  final Function()? onClickSaveNew;
  final Function()? onClickSave;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * .058,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: onClickSaveNew,
                child: Container(
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    "Save & New",
                    style: interFontGrey(context,
                        color: Colorconst.cBlack,
                        fontsize: 15,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: onClickSave,
                child: Container(
                  color:saveBackGroundClr?? Colors.blue,
                  child: Center(
                      child: Text(
                    "Save",
                    style: interFontGrey(context,
                        color: Colorconst.cwhite,
                        fontsize: 15,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )),
            ],
          )),
         isOnlyTwoButtons ==null? SizedBox(
            width: screenWidth * .06,
          ):const SizedBox(),
         isOnlyTwoButtons ==null? Transform(
            transform: Matrix4.diagonal3Values(-1, 1, 1),
            alignment: Alignment.center,
            child: Icon(
              Icons.reply,
              size: 23,
              color: Colors.blue,
            ),
          ):SizedBox()
        ],
      ),
    );
  }
}