import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constatnts/colors.dart';



class ReferEarnScreen extends StatelessWidget {
  const ReferEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200.h,
                            color: Colors.red.shade100,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 13.w),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 23.h,
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Icon(
                                          Icons.arrow_back,
                                          size: 20.sp,
                                          color: Colors.black,
                                        ),
                                      )),
                                  Text(
                                    "Refer & Earn",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      "Win exciting prizes after your friends make their first sale!",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Chances to Win!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: BoxDecoration(
                                    color: const Color(0xff888ae9),
                                    borderRadius: BorderRadius.circular(30.r)),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                "Printer worth \n₹25,000",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: 10.sp,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 70.h,
                                width: 70.h,
                                decoration: BoxDecoration(
                                    color: const Color(0xff28acb7),
                                    borderRadius: BorderRadius.circular(38.r)),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                "Printer worth \n₹25,000",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: 10.sp,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: BoxDecoration(
                                    color: const Color(0xfffd7d71),
                                    borderRadius: BorderRadius.circular(30.r)),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                "Printer worth \n₹25,000",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: 10.sp,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Other Prizes!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          lifetimeCirlcle(),
                          lifetimeCirlcle(circleColor: const Color(0xffd0cae4)),
                          lifetimeCirlcle(circleColor: const Color(0xffe2f3dd)),
                          lifetimeCirlcle(circleColor: const Color(0xffe6d9ca)),
                         
                        ],
                      ),
                    
                  
                  
                    ],
                  ),
                ),
              ],
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
                            color: Colorconst.cRed),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 18.w),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.whatsapp,size: 10.sp,color: Colors.white,),
                              SizedBox(width: 6.w,),
                              Text("Share on Whatsapp",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget lifetimeCirlcle({Color? circleColor}){

    return Container(
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                    color: circleColor??const Color(0xffebced3),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lifetime",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 8.sp,
                            color: Colors.red.shade300,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "Lifetime",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 8.sp,
                            color: Colors.red.shade300,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
  }
}
