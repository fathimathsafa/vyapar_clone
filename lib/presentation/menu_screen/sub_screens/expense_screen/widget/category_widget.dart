import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/expense_screen/view/expense_detail_screen.dart';

import '../../../../../core/constatnts/colors.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, this.obj});
  final Categories? obj;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1.w, color: Colorconst.cSecondaryGrey))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              obj != null ? obj!.expenseTitle.toString() : "data",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              obj != null ? obj!.expenseValue.toString() : "₹ 0.00 ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
