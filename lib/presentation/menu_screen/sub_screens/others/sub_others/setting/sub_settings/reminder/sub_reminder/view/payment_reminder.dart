import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';

import 'package:vyapar_clone/core/constatnts/colors.dart';

class PaymentReminderScreen extends StatelessWidget {
  const PaymentReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Colors,
      appBar: AppBar(
        backgroundColor: Colorconst.cSecondaryBlue,
        elevation: 0,
        title: Text(
          "Payment Reminder",
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
                radius: 12.r,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 18.sp,
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
        ],
      ),
    );
  }

  void  _showEditMessageDialog(){


    Get.dialog(Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 12.h),
                            child: Center(child: Text("Your message",style: GoogleFonts.inter(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w500),)),
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h,),
                  Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 13.w),
                    child: Column(
                      children: [
                        Text("Hi, \nIt's a friendly reminder to you for paying <balance amount to me",style: GoogleFonts.inter(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w500),),

                        SizedBox(height: 13.h,),
                     
                     customTextFormFieldNew(maxLines: 7,labelText: "Type Additional Message"),


                        SizedBox(height: 13.h,),
                        

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colorconst.cSecondaryGrey,
                              borderRadius: BorderRadius.circular(13.r)),

                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                                child: Text("SET DEFAULT",style: GoogleFonts.inter(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500,),),
                              ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () => Get.back(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colorconst.cSecondaryGrey,
                                    borderRadius: BorderRadius.circular(0.r)),
                                
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                                      child: Text("CENCEL",style: GoogleFonts.inter(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w500,),),
                                    ),
                                ),
                              ),
                              SizedBox(width: 7.w,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colorconst.cBlue,
                                  borderRadius: BorderRadius.circular(0.r)),
                              
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
                                    child: Text("SAVE",style: GoogleFonts.inter(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w500,),),
                                  ),
                              ),
                            ],
                          ),
                        ],)
                      ],
                    ),
                  ),

                   SizedBox(height: 14.h,),
                ],),
              
                
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _taxesWidget() {
    return Column(
      children: [
        // headerBlue(headerName: "Themes"),

        rowCollection(
          title: "GSTIN Number",
          isTurnedOn: true,
        ),
        settingsRows(leftRow: [
          Text(
            "Remind me for payment due more than",
            style: settingTxtStyle(),
          ),
        ], rightRow: [
          GestureDetector(
            // onTap: () => _controller.setDecimalNumber(true),
            child: Text(
              "-",
              style: optionsTextStyle(
                fontWeight: FontWeight.w300,
                textSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          Column(
            children: [
              Text(
                "2",
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
          InkWell(
            //  onTap: () => _controller.setDecimalNumber(false),
            child: Text(
              "+",
              style: optionsTextStyle(),
            ),
          ),
        ]),
         Divider(
          color: Colorconst.cSecondaryGrey,
          height: 1.w,
        ),
        settingsRows(leftRow: [
          Text(
            "Self Payment Reminder",
            style: settingTxtStyle(),
          ),
        ], rightRow: [
         Text(
                "Once a Day",
                style: optionsTextStyle(),
              ),
              SizedBox(width: 12.w,),

              Icon(Icons.arrow_drop_down,size: 18.sp,color: Colors.black54,)
        
        
       
        ]),
         Divider(
          color: Colorconst.cSecondaryGrey,
          height: 1.w,
        ),

   headerBlue(headerName: "Payment Reminder For party"),
       
        rowCollection(
            isTurnedOn: true,
            title: "Reminder message to party",
            grandRightIcon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 12.sp,
              color: Colors.black,
            ),
            onTap: () => _showEditMessageDialog(),
            ),

      
      ],
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
    Function()? onTap
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
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
