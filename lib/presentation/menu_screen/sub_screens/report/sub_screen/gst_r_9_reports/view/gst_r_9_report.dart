import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../../../../../controller/menu_controller.dart';

class GstR9ReportScreen extends StatelessWidget {
  GstR9ReportScreen({super.key});

  final MenuGetController _controller = Get.put(MenuGetController());

  final controller = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryBlue,
      appBar: AppBar(
        title: const Text(
          "GSTR9 Report",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        // actions: [
        //   InkWell(
        //     onTap: () => _pdfBottomSheet(),
        //     child: Icon(
        //       FontAwesomeIcons.solidFilePdf,
        //       size: 20.sp,
        //       color: Colors.red,
        //     ),
        //   ),
        //   SizedBox(
        //     width: 15.w,
        //   ),
        //   Icon(
        //     FontAwesomeIcons.solidFileExcel,
        //     size: 20.sp,
        //     color: Colors.green,
        //   ),
        //   SizedBox(
        //     width: 15.w,
        //   )
        // ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colorconst.cSecondaryGrey,
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 16.sp,
                        color: Colorconst.cBlue,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Select Year : 2024 to 2025 ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 12.h,
                          width: 12.h,
                          child: const Checkbox(value: false, onChanged: null)),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        "Consider non tax transactions as exempted ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
                      )
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

                Obx(() {
                  return SizedBox(
                    height: 400.h,
                    width: double.infinity,
                    child: _controller.pdfPath.value != ""
                        ? PdfViewer.openFile(
                            _controller.pdfPath.value,
                            viewerController: controller,
                            params: const PdfViewerParams(
                                //  minScale: 1.0,
                                //  maxScale: 3.0,
                                ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  );
                })

                // saleWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle pdfOptionStyle() {
  return TextStyle(
      color: Colors.black54, fontSize: 15.sp, fontWeight: FontWeight.w600);
}
