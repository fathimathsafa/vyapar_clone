import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

import '../../../../../controller/menu_controller.dart';



class Gst1Screen extends StatelessWidget {
  Gst1Screen({super.key});

  final MenuGetController _controller = Get.put(MenuGetController());

  final List<String> gst1tabList = ["Sale", "Sale Return"];

  final List<SaleObjects> saleList = [
    SaleObjects(
      widget1: Text(
        "",
        style: cellTxtStyle(),
      ),
      widget2: Text(
        "Gst IN Unit no",
        style: cellTxtStyle(),
      ),
      widget3: Text(
        "Totals",
        style: cellTxtStyle(),
      ),
    ),
    SaleObjects(
        widget3: Text(
          "",
          style: cellTxtStyle(),
        ),
        widget1: Text(
          "",
          style: cellTxtStyle(),
        ),
        widget2: Text(
          "PartyName",
          style: cellTxtStyle(),
        )),
    SaleObjects(
        widget3: Text(
          "₹ 0.00",
          style: cellTxtStyle(),
        ),
        widget1: Text(
          "Invoice",
          style: cellTxtStyle(),
        ),
        widget2: Row(
          children: [
            Text(
              "No",
              style: cellTxtStyle(),
            ),
            SizedBox(
              width: 20.w,
            ),
            Transform.rotate(
                angle: -1.55,
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 12.sp,
                  color: Colors.black45,
                )),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Gst IN Unit no",
              style: cellTxtStyle(),
            ),
            SizedBox(
              width: 20.w,
            ),
            Transform.rotate(
                angle: -1.55,
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 12.sp,
                  color: Colors.black45,
                ))
          ],
        )),
    SaleObjects(
        widget3: Text(
          "",
          style: cellTxtStyle(),
        ),
        widget1: Text(
          "",
          style: cellTxtStyle(),
        ),
        widget2: Text(
          "Rate",
          style: cellTxtStyle(),
        )),
    SaleObjects(
        widget3: Text(
          "₹ 0.00",
          style: cellTxtStyle(),
        ),
        widget1: Text(
          "",
          style: cellTxtStyle(),
        ),
        widget2: Text(
          "CESS Rate",
          style: cellTxtStyle(),
        )),
    SaleObjects(
        widget3: Text(
          "₹ 0.00",
          style: cellTxtStyle(),
        ),
        widget1: Text(
          "",
          style: cellTxtStyle(),
        ),
        widget2: Row(
          children: [
            Text(
              "Intgrated Tax",
              style: cellTxtStyle(),
            ), SizedBox(width: 13.w,),
            Text(
              "Central Tax",
              style: cellTxtStyle(),
            ), SizedBox(width: 13.w,),
            Text(
              "State?UT",
              style: cellTxtStyle(),
            ), SizedBox(width: 13.w,),
            Text(
              "CESS",
              style: cellTxtStyle(),
            ), SizedBox(width: 13.w,),
          ],
        )),
    SaleObjects(
        widget3: Text(
          "",
          style: cellTxtStyle(),
        ),
        widget1: Text(
          "",
          style: cellTxtStyle(),
        ),
        widget2: Text(
          "Place Of Supply",
          style: cellTxtStyle(),
        ),
        rightBorderColor: Colors.transparent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryBlue,
      appBar: AppBar(
        title: const Text(
          "GSTR1 Report",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Icon(
            FontAwesomeIcons.solidFile,
            size: 20.sp,
            color: Colors.green,
          ),
          SizedBox(
            width: 15.w,
          ),
          InkWell(
            onTap: () => _pdfBottomSheet(),
            child: Icon(
              FontAwesomeIcons.solidFilePdf,
              size: 20.sp,
              color: Colors.red,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Icon(
            FontAwesomeIcons.solidFileExcel,
            size: 20.sp,
            color: Colors.green,
          ),
          SizedBox(
            width: 15.w,
          )
        ],
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
                      Column(
                        children: [
                          Text(
                            "September 2024 ",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: List.generate(
                              25,
                              (index) => Padding(
                                padding: EdgeInsets.only(right: 1.h),
                                child: Container(
                                  height: 1.w,
                                  width: 2.w,
                                  color: Colorconst.cGrey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "To ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        children: [
                          Text(
                            "September 2024 ",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: List.generate(
                              25,
                              (index) => Padding(
                                padding: EdgeInsets.only(right: 1.h),
                                child: Container(
                                  height: 1.w,
                                  width: 2.w,
                                  color: Colorconst.cGrey,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
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
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 12.h,
                          width: 12.h,
                          child: const Checkbox(value: false, onChanged: null)),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        "Consider non tax transactions as exempted ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
                      )
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
                  padding: EdgeInsets.only(top: 9.h,),
                  child: Obx(() {
                    return Row(
                      children: List.generate(
                        gst1tabList.length,
                        (index) => Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _controller.selectedGstTabIndex.value = index;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 2.w,
                                          color: index ==
                                                  _controller
                                                      .selectedGstTabIndex
                                                      .value
                                              ? Colorconst.cRed
                                              : Colors.transparent)),
                                  color: Colors.transparent),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: Center(
                                  child: Text(
                                    gst1tabList[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: index ==
                                                _controller
                                                    .selectedGstTabIndex
                                                    .value
                                            ? Colorconst.cRed
                                            : Colors.black54),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                Obx(() {
                  return _controller.selectedGstTabIndex.value == 0
                      ? saleWidget()
                      : saleWidget();
                })

                // saleWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget saleWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          growable: true,
          saleList.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      right: BorderSide(width: 1.w, color:saleList[index].rightBorderColor ?? Colorconst.cGrey))),
              child: Column(
                children: [
                  SizedBox(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                      child: saleList[index].widget1,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                            top:
                                BorderSide(width: 1.w, color: Colorconst.cGrey),
                            bottom:
                                BorderSide(width: 1.w, color: Colorconst.cGrey),
                          )),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 8.h),
                        child: saleList[index].widget2,
                      )),
                  SizedBox(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    child: saleList[index].widget3,
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _pdfBottomSheet(){

    Get.bottomSheet(Container(

      height: 240.h,
      width: double.infinity,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.only(topLeft: Radius.circular(13.r),topRight: Radius.circular(13.r)),
        color: Colors.white
        ),
        child: Column(children: [
          SizedBox(height: 10.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 13.w,vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("PDF Options",style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.w500),),
                  Icon(Icons.close,size: 20.sp, color: Colors.black54,)
                ],
              ),
            ),
            Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 13.w,vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.file,size: 18.sp, color: Colors.black54,),
                  SizedBox(width: 20.w,),
                  Text("Open PDF",style:pdfOptionStyle() ,),
                ],
              ),
            ),
            Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 13.w,vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.print,size: 18.sp, color: Colors.black54,),
                  SizedBox(width: 20.w,),
                  Text("Print PDF",style: pdfOptionStyle(),),
                ],
              ),
            ),
            Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 13.w,vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.share,size: 18.sp, color: Colors.black54,),
                  SizedBox(width: 20.w,),
                  Text("Share PDF",style: pdfOptionStyle(),),
                ],
              ),
            ),
            Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 13.w,vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(FontAwesomeIcons.download,size: 18.sp, color: Colors.black54,),
                  SizedBox(width: 20.w,),
                  Text("Save PDF to Phone",style: pdfOptionStyle(),),
                ],
              ),
            ),
            // Divider(height: 1.w,color: Colorconst.cSecondaryGrey,),
        ],),
    ));
  }
}

class SaleObjects {
  Color? rightBorderColor;
  Widget? widget1;
  Widget? widget2;
  Widget? widget3;
  SaleObjects({this.widget1, this.widget2, this.widget3, this.rightBorderColor});
}

TextStyle cellTxtStyle(){

  return  TextStyle(color: Colors.black54,fontSize: 13.sp,fontWeight: FontWeight.w600);
}
TextStyle pdfOptionStyle(){

  return  TextStyle(color: Colors.black54,fontSize: 15.sp,fontWeight: FontWeight.w600);
}
