import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../../core/constatnts/colors.dart';
import '../../../../../../sync_and_shear_screen/view/syn_and_shear_screen.dart';



class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "User Management",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
        leading: Padding(
          padding: EdgeInsets.all(9.0.r),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
                radius: 10.r,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 16.sp,
                )),
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.headphones_outlined,
                size: 22.sp,
                color: Colors.black,
              ),
              CircleAvatar(radius: 3.r, backgroundColor: Colorconst.cRed)
            ],
          ),
          SizedBox(
            width: 13.w,
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(
            height: 1.w,
            color: Colorconst.cGrey,
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Container(
              decoration: BoxDecoration(
                  color: Colorconst.cfafafaLightGrey,
                  borderRadius: BorderRadius.circular(4.r),
                  border:
                      Border.all(width: 1.w, color: Colorconst.cSecondaryGrey)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                height: 1.4.h,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: "Note:",
                                  style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      " Vyapar does not support multi-user access on the same device anymore.",
                                  style: GoogleFonts.inter(
                                      height: 1.4.h,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You can view the old user activity",
                          style: GoogleFonts.inter(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "here.",
                          style: GoogleFonts.inter(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "For more information",
                          style: GoogleFonts.inter(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "click here.",
                          style: GoogleFonts.inter(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h,),
          Container(
            color: Colorconst.cBlue,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 13.w,vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Introducing an enhanced sync.",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 4.h,),
                      Text(
                        "Now you can manage user permissions from sync itself.",
                        style: GoogleFonts.inter(
                            height: 1.4.h,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),
                      SizedBox(height: 15.h,),
                      GestureDetector(
                        onTap: () => Get.to(()=>SyncShareScreen()),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 7.h, horizontal: 12.w),
                            child: Text(
                              "Go to Sync",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                  SizedBox(
                    width: 160.w,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
