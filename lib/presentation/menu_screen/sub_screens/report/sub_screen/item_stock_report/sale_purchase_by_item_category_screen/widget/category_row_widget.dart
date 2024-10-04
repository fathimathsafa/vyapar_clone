import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart'; // Ensure you have this import for responsive sizes

class CategoryRowWidget extends StatelessWidget {
  const CategoryRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.0.w, right: 6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Item Category',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colorconst.cGrey,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            'Sale Qty',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colorconst.cGrey,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            'Purchase qty',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colorconst.cGrey,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
