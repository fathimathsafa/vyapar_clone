import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../../../../../../../core/constatnts/images.dart';

class SaleSummaryScreen extends StatelessWidget {
  SaleSummaryScreen({super.key});

  // final MenuGetController _controller = Get.put(MenuGetController());

  // final controller = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryBlue,
      appBar: AppBar(
        title: Text(
          "Sale Summary by HSN",
          style: TextStyle(color: Colors.black, fontSize: 16.sp),
        ),
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () => _pdfBottomSheet(),
            child: Icon(
              FontAwesomeIcons.solidFilePdf,
              size: 20.sp,
              color: Colors.red,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Icon(
            FontAwesomeIcons.solidFileExcel,
            size: 20.sp,
            color: Colors.green,
          ),
          SizedBox(
            width: 15.w,
          )
        ],
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
                        ),
                      ),
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
                    child: Container(
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
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    "No data is available for Sale Summary by HSN. Please try again after making relevant changes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _pdfBottomSheet() {
    Get.bottomSheet(Container(
      height: 240.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13.r), topRight: Radius.circular(13.r)),
          color: Colors.white),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PDF Options",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.close,
                  size: 20.sp,
                  color: Colors.black54,
                )
              ],
            ),
          ),
          Divider(
            height: 1.w,
            color: Colorconst.cSecondaryGrey,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.file,
                  size: 18.sp,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "Open PDF",
                  style: pdfOptionStyle(),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.w,
            color: Colorconst.cSecondaryGrey,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.print,
                  size: 18.sp,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "Print PDF",
                  style: pdfOptionStyle(),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.w,
            color: Colorconst.cSecondaryGrey,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.share,
                  size: 18.sp,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "Share PDF",
                  style: pdfOptionStyle(),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.w,
            color: Colorconst.cSecondaryGrey,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.download,
                  size: 18.sp,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "Save PDF to Phone",
                  style: pdfOptionStyle(),
                ),
              ],
            ),
          ),
          // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
        ],
      ),
    ));
  }
}

TextStyle pdfOptionStyle() {
  return TextStyle(
      color: Colors.black54, fontSize: 15.sp, fontWeight: FontWeight.w600);
}
