import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class StockItemCard extends StatelessWidget {
  final String name;
  final String stockValue;
  final int stockQty;

  StockItemCard(
      {required this.name, required this.stockValue, required this.stockQty});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colorconst.cBlack)),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Stock Value: $stockValue',
                    style: TextStyle(fontSize: 12.sp, color: Colorconst.cGrey)),
                Text('Stock Qty: ${stockQty.toString()}',
                    style: TextStyle(fontSize: 12.sp, color: Colorconst.cGrey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
