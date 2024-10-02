import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../sub_settings/genral/view/genral.dart';
import '../sub_settings/invoice_print/view/invoice_print.dart';
import '../sub_settings/taxes_gst/view/taxes_gst.dart';
import '../sub_settings/transaction/view/transaction.dart';
import '../sub_settings/user_management/view/user_management.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  final int sIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Colors,
      appBar: AppBar(
        backgroundColor: Colorconst.cSecondaryBlue,
        elevation: 0,
        title: Text(
          "Settings",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
        leading: Padding(
          padding: EdgeInsets.all(9.0.r),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: CircleAvatar(
                radius: 10.r,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 16.sp,
                )),
          ),
        ),
        actions: [
          SizedBox(
            width: 13.w,
          ),
          Icon(
            Icons.search,
            size: 22.sp,
            color: Colors.black,
          ),
          SizedBox(
            width: 13.w,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          
              
          
              _goldPlanWidget(icon: Icons.settings,title: "General",isNewEn: true,onTap: () => Get.to(()=>const GenralSettingScreen()),),
              _goldPlanWidget(icon: Icons.currency_rupee_outlined,title: "Transaction",isNewEn: true,onTap: () => Get.to(()=>const TransactionSettingScreen()),),
              _goldPlanWidget(icon: Icons.print_outlined,title: "Invoice Print",isNewEn: false, onTap: () => Get.to(()=>const InvoicePrintScreen()),),
              _goldPlanWidget(icon: FontAwesomeIcons.filePowerpoint,title: "Taxes & GST",isNewEn: true, onTap: () => Get.to(()=>const TaxesGstScreen()),),
              _goldPlanWidget(icon: FontAwesomeIcons.users,title: "User Management",isNewEn: false, onTap: () => Get.to(()=>const UserManagementScreen()),),
              // _goldPlanWidget(icon: Icons.message_sharp,title: "Transaction SMS",isNewEn: false, onTap: () => Get.to(()=>const TransactionSmsScreen()),),
              // _goldPlanWidget(icon: Icons.notifications_outlined,title: "Reminders",isNewEn: false,onTap: () => Get.to(()=>const RemidersScreen()),),
              // _goldPlanWidget(icon: FontAwesomeIcons.users,title: "Party",isNewEn: false,onTap: () => Get.to(()=>const PartyScreen()),),
              // _goldPlanWidget(icon: FontAwesomeIcons.listOl,title: "Item",isNewEn: false,onTap: () => Get.to(()=>const ItemScreen()),),
              
              
            ],
          ),
        ),
      ),
    );
  }

 

  Widget _goldPlanWidget({IconData? icon,String? title,bool? isNewEn=false,Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.w, color: Colorconst.cGrey))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                  child: Row(
                    children: [
                      Icon(
                       icon?? Icons.settings,
                        size: 20.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                       title?? "General",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            color: Colors.grey.shade700,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                     isNewEn == true? Container(
                        decoration: BoxDecoration(
                            color: Colorconst.cRed,
                            borderRadius: BorderRadius.circular(4.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 2.h),
                          child: Text(
                            "New",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ):const SizedBox(),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 13.sp,
                            color: Colors.grey,
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
    );
  }
}
