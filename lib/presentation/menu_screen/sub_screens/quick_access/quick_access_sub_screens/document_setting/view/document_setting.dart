import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/common/widget/appbar_common.dart';
import '../../../../../../../core/constatnts/colors.dart';
import '../../invoice_templates/view/invoice_template.dart';

class DocumentSettingScreen extends StatelessWidget {
  DocumentSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      appBar: appBarCom(
        title: "Document Settings",
        bacGroundColor: Colors.white,
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
                  _topBtnWidget(onTap: () => Get.to(()=>InvoiceTemplateScreen()),),
                  SizedBox(
                    height: 20.h,
                  ),
                  _topBtnWidget(
                      topWidget: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(3.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 2.h),
                          child: Center(
                            child: Text(
                              "PRO",
                              style: GoogleFonts.inter(
                                  fontSize: 11.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      topTxt: "Manage Custom Headers",
                      bottomTxt: "Active fields will be shown in the Invoice."),
                  SizedBox(
                    height: 20.h,
                  ),
                  _topBtnWidget(
                      rightWidget: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: Colors.blue,
                      ),
                      topTxt: "Document Theme Color:",
                      bottomTxt: "Customize documets to your brand color ."),
                  SizedBox(
                    height: 20.h,
                  ),
                  _optionWidget(
                    bottomLeftWidget: Padding(
                      padding:  EdgeInsets.only(top: 2.h),
                      child: Row(
                        children: [
                          Text(
                            " Example INV/22-23/",
                            style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h,),
                  _optionWidget(
                   topTxt: "Purchase Invoice Prefix",
                   centerTxt: "PO-"
                   
                  ),
                  SizedBox(height: 20.h,),
                  _optionWidget(
                   topTxt: "Purchase Invoice Prefix",
                   centerTxt: "PO-"
                   
                  ),
                  SizedBox(height: 20.h,),
                  _optionWidget(
                   topTxt: "Purchase Invoice Prefix",
                   centerTxt: "PO-"
                   
                  ),
                  SizedBox(height: 20.h,),
                  _optionWidget(
                   topTxt: "Purchase Invoice Prefix",
                   centerTxt: "PO-"
                   
                  ),
                  SizedBox(height: 20.h,),
                  _optionWidget(
                   topTxt: "Purchase Invoice Prefix",
                   centerTxt: "PO-"
                   
                  ),
                  SizedBox(height: 20.h,),
                  _optionWidget(
                   topTxt: "Purchase Invoice Prefix",
                   centerTxt: "PO-"
                   
                  ),
                  SizedBox(height: 20.h,),
                  _optionWidget(
                   topTxt: "Purchase Invoice Prefix",
                   centerTxt: "PO-"
                   
                  ),
                  SizedBox(height: 20.h,),

                  _additionalCustomization(),
                  SizedBox(height: 100.h,),
                ],
              ),
            ),
          ),
          _bottomButtonWidget()
        ],
      ),
    );
  }



  Widget _additionalCustomization(){
    return Column(children: [

       Row(
          children: [
            Text(
              "Additional Customizations",
              style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),



           
          ],
        ),
        SizedBox(height: 20.h,),

            _toggleOptionWidget(topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
            _toggleOptionWidget(isOn: true, topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
            _toggleOptionWidget(topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
            _toggleOptionWidget(isOn: true, topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
            _toggleOptionWidget(topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
            _toggleOptionWidget(isOn: true, topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
            _toggleOptionWidget(topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
            _toggleOptionWidget(isOn: true, topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
            _toggleOptionWidget(topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
            _toggleOptionWidget(isOn: true, topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
            _toggleOptionWidget(topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
            _toggleOptionWidget(isOn: true, topTxt: "Show Images",bottomTxt: "This will show images on all documents, provided images are uploaded for the products, upto 5 images only."),
            SizedBox(height: 12.h,),
    ],);
  }

  Widget _toggleOptionWidget({String? topTxt,String? bottomTxt,bool? isOn=false}){

    return Row(children: [
       Expanded(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
          Text(
               topTxt?? "Additional Customizations",
                style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 1.h,),
          Text(
               bottomTxt?? "Additional Customizations",
                style: GoogleFonts.inter(
                    fontSize: 11.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
          
         ],),
       ), 
         SizedBox(width: 16.w,),
       
       Icon(isOn==false? Icons.toggle_off_outlined:Icons.toggle_on_outlined,size: 45.sp,color: isOn==false?Colors.grey:Colors.blue)
    ],);
  }

  Widget _optionWidget(
      {String? topTxt, Widget? topRightWidget, Widget? bottomLeftWidget,String?centerTxt}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              topTxt ?? "Invoice Templates",
              style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10.w,
            ),
            topRightWidget ?? const SizedBox()
          ],
        ),
        SizedBox(
          height: 9.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     centerTxt??"INV-",
                      style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Transform.rotate(
                        angle: -1.55,
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 14.sp,
                          color: Colors.black45,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomLeftWidget ?? const SizedBox()
      ],
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
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(6.r)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
                    child: Center(
                      child: Text(
                        "Update Document Settings",
                        style: GoogleFonts.inter(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          )
        ],
      ),
    );
  }

  Widget _topBtnWidget(
      {String? topTxt,
      String? bottomTxt,
      Widget? topWidget,
      Widget? rightWidget,Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                topTxt ?? "Invoice Templates",
                                style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              topWidget ?? const SizedBox()
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            bottomTxt ?? "Customise invoice templates ",
                            style: GoogleFonts.inter(
                                fontSize: 11.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          rightWidget ??
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 25.sp,
                color: Colors.black54,
              )
        ],
      ),
    );
  }
}
