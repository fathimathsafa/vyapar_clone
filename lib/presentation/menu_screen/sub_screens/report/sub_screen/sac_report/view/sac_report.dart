import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../../../../../../../core/constatnts/images.dart';

class SacReportScreen extends StatelessWidget {
  SacReportScreen({super.key});

  // final MenuGetController _controller = Get.put(MenuGetController());

  // final controller = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryBlue,
      appBar: AppBar(
        title: Text(
          "SAC Report",
          style: TextStyle(color: Colors.black, fontSize: 16.sp),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colorconst.cfafafaLightGrey,
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      Text(
                        "This Month",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Transform.rotate(
                          angle: -1.55,
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 10.sp,
                            color: Colorconst.cBlue,
                          )),
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        height: 20.h,
                        width: 1.w,
                        color: Colorconst.cSecondaryGrey,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 16.sp,
                        color: Colorconst.cBlue,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "01/09/2024",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "To",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "01/09/2024",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  height: 1.w,
                  color: Colorconst.cSecondaryGrey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filters Applied: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1.w, color: Colorconst.cGrey),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 2.h),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.filter,
                                size: 8.sp,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Text(
                                "Filters ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),
                // Divider(
                //   height: 1.w,
                //   color: Colorconst.cSecondaryGrey,
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colorconst.cSecondaryGrey,
                              border: Border.all(
                                  width: 1.w, color: Colorconst.cSecondaryGrey),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 3.h),
                            child: Text(
                              "Firm - All firms",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colorconst.cSecondaryGrey,
                              border: Border.all(
                                  width: 1.w, color: Colorconst.cSecondaryGrey),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 3.h),
                            child: Text(
                              "Transaction - All",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  height: 1.w,
                  color: Colorconst.cSecondaryGrey,
                ),

                // saleWidget()
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Imageconst().setImage(
                      imageName: "images-removebg-preview.png",
                      width: double.infinity,
                      hieght: 100.h),
                  Text(
                    "No Data Available",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

TextStyle pdfOptionStyle() {
  return TextStyle(
      color: Colors.black54, fontSize: 15.sp, fontWeight: FontWeight.w600);
}
