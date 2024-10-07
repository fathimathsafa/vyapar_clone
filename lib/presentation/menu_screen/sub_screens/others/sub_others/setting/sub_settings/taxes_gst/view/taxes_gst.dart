import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vyapar_clone/core/constatnts/colors.dart';

class TaxesGstScreen extends StatelessWidget {
  const TaxesGstScreen({super.key});
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
          "Taxes & GST",
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

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(
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
                    _taxesWidget(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colorconst.cSecondaryBlue,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 8.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "GST Filling starting at ₹2,999!",
                      style: settingTxtStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 6.h,horizontal: 8.w),
                      child: Row(
                        children: [
                          Text(
                            "Explore now",
                            style: settingTxtStyle(color: Colors.blue),
                          ), SizedBox(width: 3.w,),
                          Icon(
                            Icons.arrow_forward,
                            size: 15.sp,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _taxesWidget() {
    return Column(
      children: [
        // headerBlue(headerName: "Themes"),
        rowCollection(
            isTurnedOn: true,
            title: "Tax List",
            grandRightIcon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 12.sp,
              color: Colors.black,
            )),
        rowCollection(
          title: "GST",
          isTurnedOn: true,
        ),
        rowCollection(
          title: "HSN/SAC Code",
          isTurnedOn: true,
        ),
        rowCollection(
          title: "Additional CESS",
          isTurnedOn: false,
        ),
        rowCollection(
          title: "Reveser Charge",
          isTurnedOn: false,
        ),
        rowCollection(
          title: "State of Suplly",
          isTurnedOn: true,
        ),
        rowCollection(
          title: "E-Way Bill No.",
          isTurnedOn: false,
        ),
        rowCollection(
          title: "Composite Scheme",
          isTurnedOn: false,
        ),
        rowCollection(
            title: "Enable TCS",
            isTurnedOn: false,
            leftIconWidget: CircleAvatar(
              radius: 6.r,
              backgroundColor: Colors.amber,
              child: Icon(
                FontAwesomeIcons.crown,
                size: 6.sp,
                color: Colors.black,
              ),
            )),
        rowCollection(
            title: "Enable TDS",
            isTurnedOn: false,
            leftIconWidget: CircleAvatar(
              radius: 6.r,
              backgroundColor: Colors.amber,
              child: Icon(
                FontAwesomeIcons.crown,
                size: 6.sp,
                color: Colors.black,
              ),
            )),
      ],
    );
  }

  Widget headerTabButton() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 6.h, bottom: 10.h),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colorconst.cBlue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.r),
                  bottomLeft: Radius.circular(3.r)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Center(
                  child: Text(
                "Register",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 11.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              )),
            ),
          )),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(3.r),
                    topLeft: Radius.circular(3.r),
                    topRight: Radius.circular(3.r),
                    bottomRight: Radius.circular(3.r)),
                border: Border(
                    top: BorderSide(width: 1.w, color: Colorconst.cGrey),
                    left: BorderSide(width: 1.w, color: Colorconst.cGrey),
                    right: BorderSide(width: 1.w, color: Colorconst.cGrey),
                    bottom: BorderSide(width: 1.w, color: Colorconst.cGrey))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Center(
                  child: Text(
                "Thermal",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 11.sp,
                    color: Colorconst.cBlue,
                    fontWeight: FontWeight.w400),
              )),
            ),
          )),
        ],
      ),
    );
  }

  Widget rowCollection({
    String? title,
    bool? isTurnedOn,
    Icon? otherIconOnRight,
    Icon? grandRightIcon,
    String? rightSideText,
    bool? isLeftDot,
    bool? isErroIcon = true,
    Widget? leftIconWidget,
  }) {
    return Column(
      children: [
        settingsRows(leftRow: [
          Text(
            title ?? "",
            style: settingTxtStyle(),
          ),
          SizedBox(
            width: 4.w,
          ),
          isErroIcon == true
              ? Icon(
                  Icons.error,
                  size: 12.sp,
                  color: Colors.grey,
                )
              : const SizedBox(),
          SizedBox(
            width: 8.w,
          ),
          isLeftDot == true
              ? CircleAvatar(
                  radius: 3.r,
                  backgroundColor: Colors.red,
                )
              : const SizedBox(),
          leftIconWidget ?? const SizedBox()
        ], rightRow: [
          Text(
            rightSideText ?? "",
            style: optionsTextStyle(),
          ),
          otherIconOnRight ?? const SizedBox(),
          SizedBox(
            width: 12.w,
          ),
          grandRightIcon ??
              Icon(
                isTurnedOn == true
                    ? Icons.toggle_on_outlined
                    : Icons.toggle_off_outlined,
                size: 30.sp,
                color: isTurnedOn == true ? Colorconst.cBlue : Colors.grey,
              )
        ]),
        Divider(
          color: Colorconst.cSecondaryGrey,
          height: 1.w,
        ),
      ],
    );
  }

  TextStyle settingTxtStyle({
    Color? color,
  }) {
    return GoogleFonts.inter(
        wordSpacing: -2.w,
        color: color ?? Colors.black87,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500);
  }

  TextStyle optionsTextStyle(
      {Color? color,
      FontWeight? fontWeight,
      TextDecoration? textDecoration,
      double? textSize,
      double? hieght}) {
    return GoogleFonts.inter(
        height: hieght,
        wordSpacing: -2.w,
        color: color ?? Colors.black87,
        decoration: textDecoration,
        fontSize: textSize ?? 11.sp,
        fontWeight: fontWeight ?? FontWeight.w300);
  }

  Widget headerBlue({String? headerName, Icon? rightIcon}) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colorconst.cSecondaryBlue,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 6.h, top: 10.h, left: 15.w, right: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    headerName ?? "Application",
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  rightIcon ?? const SizedBox()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget settingsRows({List<Widget>? leftRow, List<Widget>? rightRow}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      child: Row(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: leftRow ?? [],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: rightRow ?? [],
          )
        ],
      ),
    );
  }

  Widget plusMinusRow({String? title, String? plusMinusCenterTxt}) {
    return Column(
      children: [
        settingsRows(leftRow: [
          Text(
            title ?? "Extra spaces on top of PDF",
            style: settingTxtStyle(),
          ),
          SizedBox(
            width: 4.w,
          ),
          Icon(
            Icons.error,
            size: 12.sp,
            color: Colors.grey,
          )
        ], rightRow: [
          Text(
            "-",
            style: optionsTextStyle(
              fontWeight: FontWeight.w300,
              textSize: 14.sp,
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          Column(
            children: [
              Text(
                plusMinusCenterTxt ?? "0",
                style: optionsTextStyle(),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 1.w,
                width: 10.w,
                color: Colors.grey,
              )
            ],
          ),
          SizedBox(
            width: 6.w,
          ),
          Text(
            "+",
            style: optionsTextStyle(),
          ),
        ]),
        Divider(
          color: Colorconst.cSecondaryGrey,
          height: 1.w,
        )
      ],
    );
  }
}
