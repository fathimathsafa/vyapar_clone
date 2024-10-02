import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../../../../../../../../../core/common/widget/custom_text_field.dart';



class VyaparLicenceScreen extends StatelessWidget {
  const VyaparLicenceScreen({super.key});
  final int sIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: Colors,
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
          "Vyapar License",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.close,
              size: 20.sp,
              color: Colors.white,
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
            Color(0xfff3f4f7),
            Color(0xfff3f4f7),
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
                  "Order Summary",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  "Plans",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500),
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
            SizedBox(
              height: 5.h,
            ),
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: null),
                    Text(
                      "Use GSTIN for this Purchase",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          color: Colors.black54,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  child: CustomTextFormField(
                    isFiled: true,
                    filledColor: Colors.white,
                    labelText: "Enter GSTN",
                    hintText: "Enter GSTN",
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 7.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "NOTE : This number can't be updated once order is completed",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                          color: Colors.black54,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 7.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Price Details",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: 6.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 13.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1.w, color: Colorconst.cSecondaryGrey),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 14.w,vertical: 13.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Offer Price",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "₹ 799.00",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    color: Colors.black87,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "GST",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "₹ 143.82",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    color: Colors.black87,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Divider(color: Colorconst.cSecondaryGrey,height: 1.w,),
                          SizedBox(height: 10.h,),

                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Amount",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "₹ 942.82",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
            Row(
              children: [
                Expanded(
                  child: Container(
                      color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("See Price Breakup",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colorconst.cBlue,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 4.w,
                          ),
                          Transform.rotate(
                              angle: 1.59,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 10.sp,
                                color: Colorconst.cBlue,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                  color: Colorconst.cRed,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Text("Pay 942.82 /-",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ],
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
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1.w, color: Colorconst.cSecondaryGrey),
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
                          Color(0xfffeeed5),
                          Colors.white,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      color: Colors.amber.shade100,
                      border:
                          Border.all(width: 1.w, color: Colorconst.cSecondaryGrey),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
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
                                  "Gold Plan",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      color: Colors.black87,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.r),
                                      border: Border.all(
                                          color: Colors.grey.shade300)),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0.r),
                                    child: Text(
                                      "1 Year",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                          color: Colors.black87,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.r),
                                      border: Border.all(
                                          color: Colors.grey.shade300)),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0.r),
                                    child: Text(
                                      "Mobile",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                          color: Colors.black87,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              "Validity : 1 Year",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  color: Colors.amber.shade600,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "₹ 1399",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black87,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  "₹ 799",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      color: Colors.black87,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colorconst.cffe3eaRedSecondary,
                                  borderRadius: BorderRadius.circular(24.r),
                                  border:
                                      Border.all(color: Colors.grey.shade300)),
                              child: Padding(
                                padding: EdgeInsets.all(3.0.r),
                                child: Text(
                                  "43% OFF",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      color: Colors.black87,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              "",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  color: Colors.amber.shade600,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w600),
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
        ),
      ),
    );
  }
}
