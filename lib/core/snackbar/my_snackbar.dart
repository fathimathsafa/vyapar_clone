
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';





class SnackBars {

  static showAlertSnackBar({required text}) {

    return Get.rawSnackbar(
      message: text,
      snackStyle: SnackStyle.GROUNDED,
      margin: EdgeInsets.zero,
      snackPosition: SnackPosition.TOP,
      messageText: Text(text,style: TextStyle(color:Colors.white,fontSize: 16.sp),),
    );
  }
  static showErrorSnackBar({required text}) {
 
    return Get.rawSnackbar(
      message: text,
      backgroundColor: Colors.red.shade500,
      snackStyle: SnackStyle.GROUNDED,
      margin: EdgeInsets.zero,
      snackPosition: SnackPosition.TOP,
      messageText: Text(text,style:TextStyle(color:Colors.white,fontSize: 16.sp),),
    );
  }
  static showSuccessSnackBar({required text}) {

    return Get.rawSnackbar(
      message: text,
      backgroundColor: Colors.green.shade500,
      snackStyle: SnackStyle.GROUNDED,
      margin: EdgeInsets.zero,
      snackPosition: SnackPosition.TOP,
      messageText: Text(text,style: TextStyle(color:Colors.white,fontSize: 16.sp),),
    );
  }
}