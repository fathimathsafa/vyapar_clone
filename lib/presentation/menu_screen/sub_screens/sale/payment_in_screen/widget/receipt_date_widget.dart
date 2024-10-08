import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/common/widget/verticle_divider.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class DateReciptWidget extends StatelessWidget {
  DateReciptWidget({super.key, this.receiptNumber, this.date,this.onTapDate});
  final String? receiptNumber;
  final String? date;
  final Function()? onTapDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const VerticleDivider(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 15.w), // Adjusted for screen utils
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Receipt No.",
                        style: interFontBlack(context,
                            color: Colorconst.cGrey, fontsize: 15.sp),
                      ),
                      SizedBox(
                        height: 9.h, // Adjusted for screen utils
                      ),
                      Row(
                        children: [
                          Text(
                            receiptNumber ?? "1",
                            style: interFontBlack(context,
                                color: Colorconst.cBlack, fontsize: 15.sp),
                          ),
                          SizedBox(
                            width: 9.w, // Adjusted for screen utils
                          ),
                          Transform.rotate(
                            angle: -1.55,
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 13.sp, // Font size adjusted with ScreenUtil
                              color: Colors.black45,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.h, // Adjusted for screen utils
                  width: 1.w, // Adjusted for screen utils
                  color: Colors.black12,
                ),
                SizedBox(
                  width: 30.w, // Adjusted for screen utils
                ),
                Flexible(
                  child: InkWell(
                    onTap: onTapDate,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: interFontBlack(context,
                              color: Colorconst.cGrey, fontsize: 15.sp),
                        ),
                        SizedBox(
                          height: 4.h, // Adjusted for screen utils
                        ),
                        Row(
                          children: [
                            Text(
                              date ?? "9/20/2024",
                              style: interFontBlack(context,
                                  color: Colorconst.cBlack, fontsize: 15.sp),
                            ),
                            SizedBox(
                              width: 9.w, // Adjusted for screen utils
                            ),
                            Transform.rotate(
                              angle: -1.55,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 13
                                    .sp, // Font size adjusted for screen utils
                                color: Colors.black45,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h, // Adjusted for screen utils
          ),
        ],
      ),
    );
  }
}
