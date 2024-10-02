import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../../core/constatnts/colors.dart';



class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(9.0.r),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 16.sp,
            ),
          ),
        ),
        title: Text(
          "Tutorials",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          Text(
            "Hindi",
            style: TextStyle(
                color: Colors.white,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 12.w,
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 20.sp,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Text(
                "We cannot detect any internet connectivity. Please check your internet connection and try again",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Container(
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Text(
                    "RELOAD",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
