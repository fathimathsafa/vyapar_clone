import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class GreetingOfferScreen extends StatelessWidget {
  const GreetingOfferScreen({super.key});
  final int sIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // backgroundColor: Colors,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Text(
          "Greetings & Offers",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        leading: Padding(
          padding: EdgeInsets.all(9.0.r),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
                radius: 10.r,
                backgroundColor: Colorconst.cSecondaryGrey,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black54,
                  size: 16.sp,
                )),
          ),
        ),
        // actions: [
        //   Container(
        //     decoration: BoxDecoration(
        //         color: Colorconst.cSecondaryBlue,
        //         borderRadius: BorderRadius.circular(20.r)),
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        //       child: Row(
        //         children: [
        //           Icon(
        //             Icons.error_outline,
        //             color: Colorconst.cBlue,
        //             size: 12.sp,
        //           ),
        //           SizedBox(
        //             width: 5.w,
        //           ),
        //           Text(
        //             "License Info",
        //             style: TextStyle(
        //                 color: Colorconst.cBlue,
        //                 fontSize: 9.sp,
        //                 fontWeight: FontWeight.w700),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 13.w,
        //   ),
        //   Icon(
        //     Icons.more_vert_outlined,
        //     size: 19.sp,
        //     color: Colors.black54,
        //   )
        // ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.black,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Text(
                    "You can share Whatsapp greetings with your Business Name and logo as shown",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              goldPlanWidget(),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 45.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                child: InkWell(
                  // onTap: () => Get.to(()=>VyaparLicenceScreen()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        // onTap: () => Get.to(()=>FormScreen()),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 40.w),
                            child: Text("Okay",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget goldPlanWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 13.w,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40.w,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffdcf8c6),
                      Color(0xffdcf8c6),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  color: Colors.amber.shade100,
                  border: Border.all(width: 1.w, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.r),
                              topRight: Radius.circular(6.r))),
                      child: Padding(
                        padding: EdgeInsets.all(6.0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.amber[800],
                                  child: Text(
                                    "A",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        color: Colors.black54,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: Text(
                                "Agrawal and Motilal chotu Sons Hardware",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.inter(
                                    color: Colors.black87,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                height: 330.h,
                                decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6.r),
                                        bottomRight: Radius.circular(6.r))))),
                      ],
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Hi,\nThank you for doing business with us, We hope to continue a good business relationship with you. \nRegards!",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.inter(
                                color: Colors.black87,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 40.w,
          ),
        ],
      ),
    );
  }
}
