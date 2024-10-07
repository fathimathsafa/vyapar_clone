import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../../form/view/form_screen.dart';



class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});
  final int sIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: Colors,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: Padding(
        //   padding: EdgeInsets.all(9.0.r),
        //   child: GestureDetector(
        //       onTap: () => Get.back(),
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: Colors.white,
        //       size: 16.sp,
        //     ),
        //   ),
        // ),
        title: Text(
          "Webstore",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.close,
              size: 20.sp,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colorconst.cSecondaryBlue,
            Colorconst.cSecondaryBlue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: Text(
                  "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500),
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
            goldPlanWidget(),
            SizedBox(
              height: 10.h,
            ),
            goldPlanWidget(),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
              child: InkWell(
                // onTap: () => Get.to(()=>VyaparLicenceScreen()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Get.to(()=>FormScreen()),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colorconst.cRed),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 18.w),
                          child: Text("Apply Now",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500)),
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
    );
  }

  Widget goldPlanWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 13.w,
      ),
      child: Stack(
        children: [
          SizedBox(
            child: Column(
              children: [
                SizedBox(
                  height: 17.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1.w, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Padding(
                    padding: EdgeInsets.all(6.r),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.w, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 0.h),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // SizedBox(width: 8.w,),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Affordable Prices",
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.inter(
                                                  color: Colors.black87,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(height: 0.h),
                                            Text(
                                              "Simple and transparent pricing. 25% discount for Vyapar users starting at Rs. 299 p.a",
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.inter(
                                                  color: Colors.black87,
                                                  height: 1.7,
                                                  fontSize: 9.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // SizedBox(width: 8.w,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colorconst.cBlue,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.w, color: Colors.white),
                          borderRadius: BorderRadius.circular(40.r)),
                      child: Padding(
                        padding: EdgeInsets.all(4.0.r),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.indianRupeeSign,
                            size: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
