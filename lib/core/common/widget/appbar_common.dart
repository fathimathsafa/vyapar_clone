import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constatnts/colors.dart';

AppBar appBarCom({String? title, Widget?leading,List<Widget>? action,Color?bacGroundColor}){

  return AppBar(
        backgroundColor:bacGroundColor?? Colorconst.cSecondaryBlue,
        elevation: 0,
        title: Text(
          title??"",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        leading:leading?? Padding(
          padding: EdgeInsets.all(9.0.r),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
               
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 22.sp,
                )),
          ),
        ),
        actions:action?? [
          SizedBox(
            width: 13.w,
          ),
          Icon(
            Icons.search,
            size: 22.sp,
            color: Colors.black,
          ),
          SizedBox(
            width: 13.w,
          ),
        ],
      );
}