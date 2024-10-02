import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vyapar_clone/core/constatnts/text_style.dart';


class PaymentTypeBtnWidget extends StatelessWidget {
  PaymentTypeBtnWidget(
      {super.key,
      this.btnName,
      required this.index,
      required this.selectedIndex,this.onTap});

  final String? btnName;
  final int index;
  final int selectedIndex;
  final Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: index == selectedIndex ? Colors.green : Colors.transparent,
              borderRadius: BorderRadius.circular(20.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Center(
              child: Text(
                btnName?? "Credit",
                style: interFontBlack(
                   context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
