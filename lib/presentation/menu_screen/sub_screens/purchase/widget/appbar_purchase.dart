import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar? appBar({String? title,Color? backgroundColor,double? elevation,Widget? leadingIcon,TextStyle? textStyle,Color? iconTextColor}){

  return AppBar(
        backgroundColor: backgroundColor?? Colors.white,
        elevation:elevation?? 0,
        leading:leadingIcon?? IconButton(onPressed: ()=> Get.back(), icon: Icon(Icons.arrow_back,color: iconTextColor,)),
        title: Text(title?? "Purchase",style: textStyle ?? TextStyle(color: iconTextColor),),
       
      );
}