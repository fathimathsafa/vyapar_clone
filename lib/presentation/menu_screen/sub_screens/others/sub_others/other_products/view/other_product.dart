import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../sub_other_products/apply/view/apply_screen.dart';




class OtherProductScreen extends StatelessWidget {
  const OtherProductScreen({super.key});
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
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  child: Text(
                    "Products for you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () => Get.to(()=>const ApplyScreen()),
                child: goldPlanWidget()),
              SizedBox(height: 10.h,),
              InkWell(
                onTap: () => Get.to(()=>const ApplyScreen()),
                child: goldPlanWidget()),
           
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 5.h,
              ),
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
      child: Container(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width: 55.w,
                          
                          height: 55.h,
                          decoration: BoxDecoration(
                            color: Colorconst.cSecondaryBlue,
                            borderRadius: BorderRadius.circular(5.r)),
                        ),
                        SizedBox(width: 8.w,),
                        Expanded(
                     
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "GST Registration",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.inter(
                                    color: Colors.black87,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Get exclusive pricing for assisted GST registration services, starting at Rs.299",
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
                        SizedBox(width: 10.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15.sp,
                              color: Colors.blue,
                            )
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
