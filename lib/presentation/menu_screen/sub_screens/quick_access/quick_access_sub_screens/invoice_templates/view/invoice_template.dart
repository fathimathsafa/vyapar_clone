import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/common/widget/appbar_common.dart';
import '../../../../../../../core/constatnts/colors.dart';
import '../controller/controller.dart';

class InvoiceTemplateScreen extends StatelessWidget {
  InvoiceTemplateScreen({super.key});

  final _controller = Get.put(InvoiceTemplateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      appBar: appBarCom(
        title: "Invoice Templates",
        bacGroundColor: Colors.white,
        action: [
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.black, borderRadius: BorderRadius.circular(6.r)),
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
          //     child: Row(
          //       children: [
          //         Text(
          //           "Upgrade",
          //           style: TextStyle(
          //               fontSize: 12.sp,
          //               color: Colors.white,
          //               fontWeight: FontWeight.w400),
          //         ),
          //         Icon(
          //           Icons.lock_open,
          //           size: 16.sp,
          //           color: Colors.white,
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(
            width: 13.w,
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(_controller.tempList.length, (index) {
                        String name = _controller.tempList[index];
                        return InkWell(
                          onTap: () => _controller.setTempIndex(index),
                          child: Row(
                            children: [
                              Icon(
                                _controller.selectedTempIndex.value == index
                                    ? Icons.radio_button_on_outlined
                                    : Icons.radio_button_off_outlined,
                                size: 25.sp,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                name,
                                style: GoogleFonts.inter(
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        );
                      }),
                    );
                  }),
                  SizedBox(height: 20.h,),
                        
                  SizedBox(height: 470.h,
                  child:const Center(child:  CircularProgressIndicator(color: Colors.blue,)),
                  ),
                  SizedBox(height: 10.h,),
                        
                   Row(
                     children: [
                       Text(
                                    "Choose Invoice Template",
                                    style: GoogleFonts.inter(
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                     ],
                   )
                        
                ],
              ),
            ),
          ),


          SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 20.w,),
                Expanded(
                  child: Text("Long click on small Image to view full screen",style:GoogleFonts.inter(
                                                      fontSize: 13.sp,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500) ,),
                ),
              ],
            ),
            SizedBox(height: 6.h,),
          Row(
            children: [
              SizedBox(width: 20.w,),
              Expanded(
                child: Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(6.r)),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 13.w,vertical: 12.h),
                    child: Center(
                      child: Text("Save & Update",style:GoogleFonts.inter(
                                                fontSize: 15.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500) ,),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w,),
            ],
          ),
          SizedBox(height: 8.h,)

        ],),
      )
        ],
      ),

    
    );
  }
}
