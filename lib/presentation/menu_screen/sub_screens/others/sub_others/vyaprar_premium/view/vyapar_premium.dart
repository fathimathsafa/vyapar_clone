import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../sub_vyapar_premium/vyapar_licence/views/vyapar_licence.dart';



class VyaparPremiumScreen extends StatelessWidget {
  const VyaparPremiumScreen({super.key});
  final int sIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: Colors,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
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
        actions: [
          Container(
            decoration: BoxDecoration(
                color: Colorconst.cSecondaryBlue,
                borderRadius: BorderRadius.circular(20.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colorconst.cBlue,
                    size: 12.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "License Info",
                    style: TextStyle(
                        color: Colorconst.cBlue,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 13.w,
          ),
          Icon(
            Icons.more_vert_outlined,
            size: 19.sp,
            color: Colors.black54,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.grey.shade100,
            Colors.amber.shade100,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Plans & Pricing",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            // Divider(height: 20.h,color: Colorconst.cSecondaryGrey,)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 13.w,
              ),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.w, color: Colorconst.cSecondaryGrey),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Text(
                        "1 Year ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        "Mobile",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Change",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                color: Colorconst.cBlue,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Transform.rotate(
                              angle: -1.55,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 10.sp,
                                color: Colorconst.cBlue,
                              ))
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            goldPlanWidget(),

            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 5.sp,
                    color: Colors.amber.shade600,
                  ),
                  Icon(
                    Icons.star,
                    size: 7.sp,
                    color: Colors.amber.shade600,
                  ),
                  Icon(
                    Icons.star,
                    size: 9.sp,
                    color: Colors.amber.shade600,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    " PREMIUM ACCESS FOR ALL FEATURES",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.amber.shade600,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Icon(
                    Icons.star,
                    size: 9.sp,
                    color: Colors.amber.shade600,
                  ),
                  Icon(
                    Icons.star,
                    size: 7.sp,
                    color: Colors.amber.shade600,
                  ),
                  Icon(
                    Icons.star,
                    size: 5.sp,
                    color: Colors.amber.shade600,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 13,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    index == sIndex
                        ? Colors.amber.shade100
                        : Colors.transparent,
                    index == sIndex
                        ? const Color(0xffeecd7)
                        : Colors.transparent,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 14.sp,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "Everything In Silver Plan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                    index==sIndex?  CircleAvatar(
                        radius: 6.r,
                        backgroundColor: Colors.grey[400],
                        child: Icon(
                          FontAwesomeIcons.crown,
                          size: 7.sp,
                          color: Colors.black,
                        ),
                      ): CircleAvatar(
                        radius: 5.r,
                        backgroundColor: Colors.grey[400],
                        child: Icon(
                          FontAwesomeIcons.circleQuestion,
                          size: 8.sp,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.white),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      child: Row(
                        children: [
                          Text("+18 More Features",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colorconst.cBlue,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 4.w,
                          ),
                          Transform.rotate(
                              angle: -1.55,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 10.sp,
                                color: Colorconst.cBlue,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 13.w,vertical: 10.h),
              child: InkWell(
                onTap: () => Get.to(()=>const VyaparLicenceScreen()),
                child: Row(children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colorconst.cRed),
                    
                           child: Padding(
                             padding:  EdgeInsets.symmetric(vertical: 12.h),
                             child: Text("Buy Gold",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500)),
                           ),   
                    
                    ),
                  ),
                
                ],),
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
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.amber.shade100,
                      Colors.amber,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  color: Colors.amber.shade100,
                  border: Border.all(width: 1.w, color: Colors.amber.shade800),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 6.r,
                          backgroundColor: Colors.amber[300],
                          child: Icon(
                            FontAwesomeIcons.crown,
                            size: 7.sp,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              color: Colors.black54,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gold Plan",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              color: Colors.black87,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              "₹ 799",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  color: Colors.black87,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "₹ 799",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black87,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Colors.amber.shade100,
                  //     Colors.amber,
                  //   ],
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  // ),

                  color: Colors.white,
                  border: Border.all(width: 1.w, color: Colorconst.cGrey),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 6.r,
                          backgroundColor: Colors.grey.shade400,
                          child: Icon(
                            FontAwesomeIcons.crown,
                            size: 7.sp,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              color: Colors.black54,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gold Plan",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              color: Colors.black87,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              "₹ 799",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  color: Colors.black87,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "₹ 799",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black87,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
