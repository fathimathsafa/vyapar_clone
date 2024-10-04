import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  FilterChipWidget(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label,
          style: TextStyle(fontSize: 12.sp, color: Colorconst.cBlack)),
      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r), // You can adjust the radius
      ),
    );
  }
}
