import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class TransactionSettingScreen extends StatelessWidget {
  const TransactionSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Colors,
      appBar: AppBar(
        backgroundColor: Colorconst.cSecondaryBlue,
        elevation: 0,
        title: Text(
          "Transaction",
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
              headerBlue(headerName: "Transaction Header"),
              rowCollection(isTurnedOn: true, title: "Invoice/Bill Number"),
              rowCollection(isTurnedOn: false, title: "Cash Sale by default"),
              rowCollection(
                  isTurnedOn: false, title: "Billing name of parties"),
              rowCollection(
                  isTurnedOn: false, title: "PO Details(of customer)"),
              rowCollection(
                  isTurnedOn: false, title: "Add Time On Transaction"),
              headerBlue(headerName: "Items Table"),
              rowCollection(
                  isTurnedOn: true,
                  title:
                      "Allow Inclusive/Exclsive tax on           \nRate(Price/Unit)"),
              rowCollection(isTurnedOn: true, title: "Display Purchase Price"),
              rowCollection(isTurnedOn: false, title: "Free Item quality"),
              rowCollection(
                  isTurnedOn: false,
                  title: "Count",
                  otherIconOnRight: Icon(
                    Icons.edit,
                    size: 17.sp,
                    color: Colors.grey,
                  )),
              rowCollection(
                  isTurnedOn: false, title: "Barcode scanning for items"),
              headerBlue(headerName: "Taxes, Discount & Total"),
              rowCollection(isTurnedOn: false, title: "Transaction wise Tax"),
              rowCollection(
                  isTurnedOn: false, title: "Transaction wise Discount"),
              rowCollection(
                  isTurnedOn: false, title: "Round Off Transaction amount"),
              headerBlue(headerName: "More Transaction Features"),
              rowCollection(
                  isTurnedOn: false,
                  title: "Share Transaction as",
                  rightSideText: "Ask me Everytime",
                  grandRightIcon: Icon(
                    Icons.arrow_drop_down,
                    size: 20.sp,
                    color: Colors.black87,
                  )),
              rowCollection(
                  isTurnedOn: false, title: "Passcode for edit/delete"),
              rowCollection(
                  isTurnedOn: false, title: "Discount during Payment"),
              rowCollection(
                  isTurnedOn: false, title: "Link Payment to Invoices"),
              rowCollection(
                  isTurnedOn: false, title: "Due Dates and Payment terms"),
              rowCollection(isTurnedOn: true, title: "Enable Invoice Preview"),
              rowCollection(isTurnedOn: false, title: "Additional Fields"),
              rowCollection(isTurnedOn: false, title: "Transportaion Details"),
              rowCollection(
                  isTurnedOn: false,
                  title: "Additional Charges",
                  isLeftDot: true),
              rowCollection(
                  isTurnedOn: false,
                  title: "Show Profit while making Sale Invoice",
                  isLeftDot: false,
                  leftIconWidget: CircleAvatar(
                    radius: 7.r,
                    backgroundColor: Colors.amber,
                    child: Icon(
                      FontAwesomeIcons.crown,
                      size: 8.sp,
                      color: Colors.black,
                    ),
                  )),
              headerBlue(headerName: "GST"),
              rowCollection(isTurnedOn: false, title: "Reverse Charge"),
              rowCollection(isTurnedOn: true, title: "State of Supply"),
              rowCollection(isTurnedOn: false, title: "E-Way Bill No."),
              headerBlue(headerName: "Transaction Prefixes"),
              transactionPreference()
            ],
          ),
        ),
      ),
    );
  }

  Widget transactionPreference() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          CustomTextFormField(
            labelStyle: TextStyle(color: Colors.black, fontSize: 14.sp),
          
            labelText: "Firm",
            hintText: "Firm",
            isEditable: false,
            suffixIconWidget: Icon(
              Icons.arrow_drop_down,
              size: 24.sp,
              color: Colors.grey,
            ),
            hintSytle: TextStyle(color: Colors.black, fontSize: 14.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          rowWidgets(),
          rowWidgets(),
          rowWidgets(),

           Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      labelStyle: TextStyle(color: Colors.black, fontSize: 14.sp),
                      labelText: "None",
                      hintText: "None",
                      isEditable: false,
                      suffixIconWidget: Icon(
                        Icons.arrow_drop_down,
                        size: 24.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                 const Expanded(
                    child: SizedBox(),
                  )
                ],
              ),
         
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  Widget rowWidgets(){
    return  Column(
      children: [
        Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      labelStyle: TextStyle(color: Colors.black, fontSize: 14.sp),
                      labelText: "None",
                      hintText: "None",
                      isEditable: false,
                      suffixIconWidget: Icon(
                        Icons.arrow_drop_down,
                        size: 24.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      labelStyle: TextStyle(color: Colors.black, fontSize: 14.sp),
                      labelText: "None",
                      hintText: "Firm",
                      isEditable: false,
                      suffixIconWidget: Icon(
                        Icons.arrow_drop_down,
                        size: 24.sp,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
     
      SizedBox(
            height: 20.h,
          ),
     
     ],
    );
  }

  Widget rowCollection(
      {String? title,
      bool? isTurnedOn,
      Icon? otherIconOnRight,
      Icon? grandRightIcon,
      String? rightSideText,
      bool? isLeftDot,
      Widget? leftIconWidget}) {
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
          Icon(
            Icons.error,
            size: 12.sp,
            color: Colors.grey,
          ),
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
        Divider(
          color: Colorconst.cSecondaryGrey,
          height: 1.w,
        )
      ],
    );
  }

  TextStyle settingTxtStyle() {
    return GoogleFonts.inter(
        wordSpacing: -2.w,
        color: Colors.black87,
        fontSize: 13.sp,
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

  Widget headerBlue({String? headerName}) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colorconst.cSecondaryBlue,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 6.h, top: 10.h, left: 15.w, right: 15.w),
              child: Text(
                headerName ?? "Application",
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
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
}
