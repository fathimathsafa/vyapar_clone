import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vyapar_clone/core/constatnts/colors.dart';

class TransactionSmsScreen extends StatelessWidget {
  const TransactionSmsScreen({super.key});
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
          "Transaction SMS",
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
            child: SingleChildScrollView(
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
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _topWidget(),
                      _headerBlue(
                          headerName:
                              "Select transactions for automatic messaging",
                          rightIcon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 12.sp,
                            color: Colors.black,
                          )),
                      _select_transactions_for_automatic(),
                      SizedBox(
                        height: 80.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colorconst.cSecondaryBlue,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Customize & Preview Message",
                      style: settingTxtStyle(
                        fontSize: 11.sp,
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 3.w,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 12.sp,
                            color: Colors.black,
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

  Widget _topWidget() {
    return Column(
      children: [
        // headerBlue(headerName: "Themes"),

        rowCollection(
          isErroIcon: false,
          title: "Send to party",
          isTurnedOn: true,
        ),
        rowCollection(
          title: "Send SMS Copy to Self",
          isTurnedOn: false,
        ),
        rowCollection(
          isErroIcon: false,
          title: "Send Transaction Update SMS",
          isTurnedOn: false,
          textRightWidget: [
            CircleAvatar(
              radius: 3.r,
              backgroundColor: Colorconst.cRed,
            ),
            SizedBox(
              width: 2.w,
            ),
            CircleAvatar(
              radius: 6.r,
              backgroundColor: Colors.amber,
              child: Icon(
                FontAwesomeIcons.crown,
                size: 6.sp,
                color: Colors.black,
              ),
            )
          ],
        ),
        rowCollection(
            title: "Show Party's Current Balance",
            isTurnedOn: false,
            isErroIcon: false),
        rowCollection(
            title: "Show web invoice link",
            isTurnedOn: true,
            isErroIcon: false),
      ],
    );
  }

  Widget _select_transactions_for_automatic() {
    return Column(
      children: [
        // headerBlue(headerName: "Themes"),

        rowCollection(
          isErroIcon: false,
          title: "Send to party",
          isTurnedOn: true,
        ),
        rowCollection(title: "Sale", isTurnedOn: true, isErroIcon: false),

        rowCollection(
            title: "Sale Return", isTurnedOn: true, isErroIcon: false),
        rowCollection(
            title: "Purchase Return", isTurnedOn: true, isErroIcon: false),
        rowCollection(title: "Estimate", isTurnedOn: false, isErroIcon: false),
        rowCollection(title: "Payment-In", isTurnedOn: true, isErroIcon: false),
        rowCollection(
            title: "Payment-Out", isTurnedOn: true, isErroIcon: false),
        rowCollection(title: "Sale Order", isTurnedOn: true, isErroIcon: false),
        rowCollection(
            title: "Purchase Order", isTurnedOn: false, isErroIcon: false),
        rowCollection(
            title: "Delivery Challan", isTurnedOn: false, isErroIcon: false),
      ],
    );
  }

  Widget rowCollection({
    String? title,
    bool? isTurnedOn,
    List<Widget>? textRightWidget,
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
            width: 2.w,
          ),
          Row(
            children: textRightWidget ?? [],
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

  TextStyle settingTxtStyle(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return GoogleFonts.inter(
        wordSpacing: -2.w,
        color: color ?? Colors.black87,
        fontSize: fontSize ?? 12.sp,
        fontWeight: fontWeight ?? FontWeight.w500);
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

  Widget _headerBlue({String? headerName, Icon? rightIcon}) {
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
