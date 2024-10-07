import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constatnts/colors.dart';
import '../controller/controller.dart';
import '../sub_business_card/tab_1_business_card/view/business_card_1.dart';
import '../sub_business_card/tab_2_business_card/view/business_card_2.dart';
import '../sub_business_card/tab_3_business_card/view/business_card_3.dart';

class BusinessCardScreen extends StatelessWidget {
  BusinessCardScreen({super.key});
  final _controller = Get.put(BusinessCardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: TabBar(
                    controller: _controller.tabController,
                    // labelColor: Colors.black,
                    dividerColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
                    unselectedLabelColor: Colors.black87,
                    indicatorColor: Colorconst.cRed,
                    labelStyle: TextStyle(
                      color: Colorconst.cRed,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  
                   tabs:const [
                      Tab(text: 'Business Cards'),
                      Tab(text: 'WhatsApp Status'),
                      Tab(text: 'Festival Greeting'),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  controller: _controller.tabController,
                  children: [
                    BusinessCard1Screen(),
                    BusinessCard2Screen(),
                    BusinessCard3Screen(),
                  
                  ],
                ))
              ],
            ),
          ),
          _bottomButtonWidget()
        ],
      ),
    );
  }

  Widget _bottomButtonWidget() {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 6.h,
          ),
          Row(
            children: [
             
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.r)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 43.w, vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _bottomWidgets(onTap: () => Get.back(),),
                        _bottomWidgets(icon: FontAwesomeIcons.whatsapp,iconColor: Colors.green,text: "Whatsapp"),
                        _bottomWidgets(icon: FontAwesomeIcons.share,iconColor: Colors.black,text: "Share"),
                        _bottomWidgets(icon: Icons.edit,iconColor: Colors.blue,text: "Edit"),
                      ],
                    ),
                  ),
                ),
              ),
             
            ],
          ),
         
        ],
      ),
    );
  }

  Widget _bottomWidgets({Function()?onTap, String?text,IconData? icon, Color? iconColor}){

    return  InkWell(
      onTap: onTap,
      child: Center(
                            child: Column(
                              children: [
                                Icon(icon?? Icons.home_outlined,size: 26.sp, color:iconColor?? Colors.blue,),
                                SizedBox(height: 3.h,),
                                Text(
                                 text?? "Home",
                                  style: GoogleFonts.inter(
                                      fontSize: 10.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
    );
  }
}
