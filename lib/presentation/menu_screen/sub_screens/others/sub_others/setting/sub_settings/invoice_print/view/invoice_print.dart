import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vyapar_clone/core/constatnts/colors.dart';

class InvoicePrintScreen extends StatelessWidget {
  const InvoicePrintScreen({super.key});
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
          "Invoice Print",
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
            Icons.store_outlined,
            size: 22.sp,
            color: Colors.black,
          ),
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
              headerTabButton(),
              rowCollection(
                  isTurnedOn: true,
                  isErroIcon: false,
                  title: "Make Regular Printer Default"),
              _themesWidget(),
              _printCompanyInfo(),
              _totalsTaxes(),
              _footer(),
              SizedBox(
                height: 80.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _themesWidget() {
    return Column(
      children: [
        headerBlue(headerName: "Themes"),
        rowCollection(
            isTurnedOn: true,
            isErroIcon: true,
            title: "Change Theme and Colors",
            grandRightIcon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 12.sp,
              color: Colors.black,
            )),
        rowCollection(
            isTurnedOn: false,
            isErroIcon: true,
            title: "Print text size",
            rightSideText: "Medium",
            grandRightIcon: Icon(
              Icons.arrow_drop_down,
              size: 20.sp,
              color: Colors.black87,
            )),
        rowCollection(
            isTurnedOn: false,
            isErroIcon: true,
            title: "Page size",
            rightSideText: "A4(210 * 297 mm)",
            grandRightIcon: Icon(
              Icons.arrow_drop_down,
              size: 20.sp,
              color: Colors.black87,
            )),
        rowCollection(
            isTurnedOn: false,
            isErroIcon: true,
            title: "Orientation",
            rightSideText: "Potrait",
            grandRightIcon: Icon(
              Icons.arrow_drop_down,
              size: 20.sp,
              color: Colors.black87,
            )),
      ],
    );
  }

  Widget _printCompanyInfo() {
    return Column(
      children: [
        headerBlue(
            headerName: "Print Company Info/Header",
            rightIcon: Icon(
              Icons.edit,
              size: 20.sp,
              color: Colors.black54,
            )),
        rowCollection(
            isTurnedOn: true, title: "Print repeat header in all pages"),
        rowCollection(isTurnedOn: true, title: "Print Company Name"),
        rowCollection(
            isTurnedOn: false,
            title: "Company Name Text Size",
            rightSideText: "Large",
            grandRightIcon: Icon(
              Icons.arrow_drop_down,
              size: 20.sp,
              color: Colors.black87,
            )),
        rowCollection(isTurnedOn: true, title: "Comapany logo"),
        rowCollection(isTurnedOn: true, title: "Address"),
        rowCollection(isTurnedOn: true, title: "Email"),
        rowCollection(isTurnedOn: true, title: "Phone number"),
        rowCollection(isTurnedOn: true, title: "GSTIN on Sale"),
        rowCollection(
            isTurnedOn: false,
            title: "Print Bill of Supply for non tax invoices"),
        plusMinusRow(),
        rowCollection(isTurnedOn: false, title: "Print Original/Duplicate"),
        rowCollection(
            isTurnedOn: false,
            title: "Change Transaction Names",
            grandRightIcon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 12.sp,
            )),
      ],
    );
  }

  Widget _totalsTaxes() {
    return Column(
      children: [
        headerBlue(
            headerName: "Totals & Taxes",
            rightIcon: Icon(
              Icons.edit,
              size: 20.sp,
              color: Colors.black54,
            )),
        plusMinusRow(title: "Min. No. of rows in Item Table"),
        rowCollection(
            isTurnedOn: false,
            title: "Item Table Customization",
            grandRightIcon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 12.sp,
            )),
        rowCollection(
          title: "Total Item Quality",
          isTurnedOn: true,
        ),
        rowCollection(
          title: "Amount with Decimal(eg 0.00)",
          isTurnedOn: true,
        ),
        rowCollection(
          title: "Received amount",
          isTurnedOn: true,
        ),
        rowCollection(
          title: "Balance amount",
          isTurnedOn: true,
        ),
        rowCollection(
          title: "Print Current Balance of Party",
          isTurnedOn: false,
        ),
        rowCollection(
          title: "Tax details",
          isTurnedOn: true,
        ),
        rowCollection(
          title: "Amount Grouping",
          isTurnedOn: true,
        ),
        rowCollection(
            title: "Amount in words format",
            isTurnedOn: true,
            rightSideText: "Indian \nEg 1,00,00,000",
            grandRightIcon: Icon(
              Icons.arrow_drop_down,
              size: 20.sp,
              color: Colors.black87,
            )),
        rowCollection(
          title: "You Saved",
          isTurnedOn: true,
        ),
      ],
    );
  }

  Widget _footer() {
    return Column(
      children: [
        headerBlue(
            headerName: "Footer",
            rightIcon: Icon(
              Icons.edit,
              size: 20.sp,
              color: Colors.black54,
            )),
        rowCollection(
          title: "Print description",
          isTurnedOn: true,
        ),
        rowCollection(
            isTurnedOn: false,
            title: "Item Table Customization",
            grandRightIcon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 12.sp,
            )),
        rowCollection(
          title: "Print Received by details",
          isTurnedOn: true,
        ),
        rowCollection(
          title: "Print Delivered by details",
          isTurnedOn: true,
        ),
        rowCollection(
          title: "Print Signature Text",
          isTurnedOn: true,
        ),
        rowCollection(
            isTurnedOn: false,
            title: "Item Table Customization",
            grandRightIcon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 12.sp,
            )),
        rowCollection(
          title: "Payment mode",
          isTurnedOn: false,
        ),
        rowCollection(
          title: "Print Acknowledgement",
          isTurnedOn: false,
        ),
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

  TextStyle settingTxtStyle() {
    return GoogleFonts.inter(
        wordSpacing: -2.w,
        color: Colors.black87,
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
