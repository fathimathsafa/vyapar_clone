import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/images.dart';

import '../../../../../../core/common/widget/add_button_green.dart';
import '../../widget/appbar_purchase.dart';
import '../sub_purchase_return/view/add_return_screen.dart';



class PurchaseReturnListScreen extends StatelessWidget {
  PurchaseReturnListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryBlue,
      appBar: appBar(
          title: "Purchase Return",
          backgroundColor: Colors.white,
          iconTextColor: Colors.black),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(color: Colorconst.cGrey, width: 1.w))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 9.h),
                child: Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 12.w,),
                        Text(
                          "This Month",
                          style:
                              TextStyle(color: Colors.black45, fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        Transform.rotate(
                            angle: -1.55,
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 12.sp,
                              color: Colors.black45,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      height: 12.h,
                      width: 1.w,
                      color: Colorconst.cGrey,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                     Icon(
                          Icons.calendar_month_outlined,
                          size: 14.sp,
                          color: Colors.blue,
                        ),
                        SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       
                        Text(
                          "01/09/2024",
                          style:
                              TextStyle(fontSize: 10.sp, color: Colors.black54),
                        ),
                        Text(
                          "To",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "01/09/2024",
                          style:
                              TextStyle(fontSize: 10.sp, color: Colors.black54),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
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
                    "No data is available for this report. Please try again after making relevant changse",
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
          ),

           Padding(
             padding:  EdgeInsets.only(bottom: 12.h),
             child: AddButtonGreen(
              backgroundColor: Colorconst.cRed,
              iconBackGroundColor: Colorconst.cRed,
              icon: Icons.add ,
              iconColor: Colors.white,
              text: "Add Purchase Return",
                      onTap: () => Get.to(() => AddReturnScreen(

                      )),
                    ),
           )
        ],
      ),
    );
  }
}
