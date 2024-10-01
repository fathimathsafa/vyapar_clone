import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../../../../../controller/menu_controller.dart';



class GstR3bScreen extends StatelessWidget {
  GstR3bScreen({super.key});

  final MenuGetController _controller = Get.put(MenuGetController());

  final controller = PdfViewerController();

  @override
  Widget build(BuildContext context) {
      //  _controller.loadPDF();
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryBlue,
      appBar: AppBar(
        title: const Text(
          "GSTR3B Report",
          style: TextStyle(
            color: Colors.black,
          ),
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
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 16.sp,
                        color: Colorconst.cBlue,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        children: [
                          Text(
                            "September 2024 ",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: List.generate(
                              25,
                              (index) => Padding(
                                padding: EdgeInsets.only(right: 1.h),
                                child: Container(
                                  height: 1.w,
                                  width: 2.w,
                                  color: Colorconst.cGrey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "To ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        children: [
                          Text(
                            "September 2024 ",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: List.generate(
                              25,
                              (index) => Padding(
                                padding: EdgeInsets.only(right: 1.h),
                                child: Container(
                                  height: 1.w,
                                  width: 2.w,
                                  color: Colorconst.cGrey,
                                ),
                              ),
                            ),
                          )
                        ],
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
               
          
                   Obx(
                    () {
                       return SizedBox(
                        height: 400.h,
                        width: double.infinity,
                                 //           child: PdfViewer.openAsset('assets/pdfs/pdf_sample.pdf',
                        
                                 //           viewerController: controller,
                                 //            params: PdfViewerParams(
                       
                                 //             pageNumber: 1,
                                
                                 //   onViewerControllerInitialized: (PdfViewerController c) {
                                 //     // controller = c;
                                 //     // controller.goToPage(pageNumber: 3); 
                                 //   }
                                 // )
                                 //           )
                       
                                 child:_controller.pdfPath.value !=""
                                 ? PdfViewer.openFile(
                                     _controller.pdfPath.value,
                                     viewerController: controller,
                                     params:const PdfViewerParams(
                                      //  minScale: 1.0,
                                      //  maxScale: 3.0,
                                     ),
                                   )
                                 :const Center(child: CircularProgressIndicator()),
                                         );
                     }
                   )
               

                // saleWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget pdfView({path}) {
  //   return PDFView(
  //     filePath: path,
  //     enableSwipe: true,
  //     swipeHorizontal: true,
  //     autoSpacing: false,
  //     pageSnap: true,
  //     onRender: (pages) {
  //       printInfo(info: 'PDF Rendered: $pages pages');
  //     },
  //     onError: (error) {
  //       printError(info: 'Error: ${error.toString()}');
  //       // Handle error
  //     },
  //     // onPageChanged: (int page, int total) {
  //     //   print('Page: $page/$total');
  //     // },
  //   );
  // }

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
