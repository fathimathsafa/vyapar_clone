import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isLowStock;

  SummaryCard(this.title, this.value, {this.isLowStock = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      width: 110.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colorconst.cwhite,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5.r,
            spreadRadius: 2.r,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(fontSize: 11.sp, color: Colorconst.cBlack)),
          Text(value,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: isLowStock ? Colorconst.cRed : Colorconst.cBlack)),
        ],
      ),
    );
  }
}
