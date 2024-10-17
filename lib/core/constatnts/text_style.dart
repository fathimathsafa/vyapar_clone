import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Function to get responsive black text style
TextStyle interFontBlack(BuildContext context, {double? fontsize, FontWeight? fontWeight, Color? color}) {
  // Get the screen width
  final screenWidth = MediaQuery.of(context).size.width;

  // Set default font size based on screen width
  final defaultFontSize = screenWidth < 600 ? 14.0 : 20.0; // Example threshold

  return TextStyle(
    fontSize: fontsize ?? defaultFontSize,
    color: color ?? Colors.black,
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}

// Function to get responsive grey text style
TextStyle interFontGrey(BuildContext context, {double? fontsize, FontWeight? fontWeight, Color? color}) {
  // Get the screen width
  final screenWidth = MediaQuery.of(context).size.width;

  // Set default font size based on screen width
  final defaultFontSize = screenWidth < 600 ? 14.0 : 20.0; // Example threshold

  return TextStyle(
    fontSize: fontsize ?? defaultFontSize,
    color: color ?? Colors.grey,
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}



TextStyle interFontBlack1({double? fontsize,FontWeight? fontWeight,Color? color}){
  return TextStyle(

    fontSize: fontsize??20.sp,
    color: color??Colors.black,
    fontWeight:fontWeight?? FontWeight.w500
  );
}

TextStyle interFontGrey1({double? fontsize,FontWeight? fontWeight,Color?color}){
  return TextStyle(

    fontSize: fontsize??20.sp,
    color:color?? Colors.grey,
    fontWeight:fontWeight?? FontWeight.w500
  );
}



