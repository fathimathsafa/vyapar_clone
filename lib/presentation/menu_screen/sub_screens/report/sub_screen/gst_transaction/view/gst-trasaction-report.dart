import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



import 'package:vyapar_clone/core/constatnts/colors.dart';


class GstTrasactionReportScreen extends StatelessWidget {
  GstTrasactionReportScreen({super.key});

  // final MenuGetController _controller = Get.put(MenuGetController());

  // final controller = PdfViewerController();

  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryBlue,
      appBar: AppBar(
        title: const Text(
          "GSTR Transaction Report",
          style: TextStyle(
            color: Colors.black,
          ),
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
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 16.sp,
                        color: Colorconst.cBlue,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Select Month/Year : September 2024 ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        Transform.rotate(
                            angle: -1.55,
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 10.sp,
                              color: Colorconst.cBlue,
                            ))
                      ],))
                      
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
                      Container(decoration: BoxDecoration(
                        border: Border.all(width: 1.w,color: Colorconst.cGrey),
                        borderRadius: BorderRadius.circular(20.r)),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 4.h),
                          child: Row(children: [
                            Icon(FontAwesomeIcons.filter,size: 8.sp,color: Colors.blue,),
                            SizedBox(width: 6.w,),
                            Text(
                          "Filters Applied: ",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500),
                                                ),
                          ],),
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
                    decoration:   BoxDecoration(
                      color: Colorconst.cSecondaryGrey,
                      border: Border.all(width: 1.w,color: Colorconst.cSecondaryGrey),
                      borderRadius: BorderRadius.circular(20.r)),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 4.h),
                        child: Text(
                          "Tax Type Don't consider no tax transactions ",
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
          Column(children: List.generate(5, (index) => Padding(
            padding:  EdgeInsets.only(top: 10.h,left: 8.w,right: 8.w),
            child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.r)),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 7.h,horizontal: 7.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(
                              "Generate",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                        
                         Container(
                        decoration:   BoxDecoration(
                          color: Colorconst.cLightRed,
                          border: Border.all(width: 1.w,color: Colorconst.cSecondaryGrey),
                          borderRadius: BorderRadius.circular(20.r)),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 4.h),
                            child: Text(
                              "Generate",
                              style: TextStyle(
                                  color: Colorconst.cRed,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                        
                                          ],),
                      ),),
          ),),),

        ],
      ),
    );
  }


  
}

TextStyle pdfOptionStyle() {
  return TextStyle(
      color: Colors.black54, fontSize: 15.sp, fontWeight: FontWeight.w600);
}
