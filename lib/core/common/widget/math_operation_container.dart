import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class QtyConatinerWidget extends StatelessWidget {
  // Accept these values from outside (for example, they could be passed from a parent widget, controller, or API call later)
  final double closingQty;
  final double beginningQty;
  final double qtyIn;
  final double qtyOut;

  QtyConatinerWidget({
    required this.closingQty,
    required this.beginningQty,
    required this.qtyIn,
    required this.qtyOut,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0.w), // Small padding for internal space
      height: 60.h, // Small height as required
      decoration: BoxDecoration(
        color: Colorconst.cwhite, // Light background color
        borderRadius: BorderRadius.circular(8.0.r), // Rounded corners
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround, // Spread columns evenly
        children: [
          // 1st Column - Closing Qty
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Closing Qty',
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colorconst.cGrey),
              ),
              SizedBox(height: 4.h),
              Text(
                closingQty
                    .toStringAsFixed(1), // Display the value with one decimal
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colorconst.cBlack),
              ),
            ],
          ),
          Text(
            '=', // Operator between the columns
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colorconst.cGrey),
          ),
          // 2nd Column - Beginning Qty
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Beginning Qty',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colorconst.cGrey),
              ),
              SizedBox(height: 4.h),
              Text(
                beginningQty.toStringAsFixed(1),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colorconst.cBlack),
              ),
            ],
          ),
          Text(
            '+', // Operator between the columns
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colorconst.cGrey),
          ),
          // 3rd Column - Qty In
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Qty In',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colorconst.cGrey),
              ),
              SizedBox(height: 4.h),
              Text(
                qtyIn.toStringAsFixed(1),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colorconst.cBlack),
              ),
            ],
          ),
          Text(
            '-', // Operator between the columns
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colorconst.cGrey),
          ),
          // 4th Column - Qty Out
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Qty Out',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colorconst.cGrey),
              ),
              SizedBox(height: 4.h),
              Text(
                qtyOut.toStringAsFixed(1),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colorconst.cBlack),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
