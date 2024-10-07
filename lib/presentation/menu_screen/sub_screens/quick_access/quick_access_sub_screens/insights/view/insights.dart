import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../core/common/widget/appbar_common.dart';
import '../../../../../../../core/constatnts/colors.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      appBar: appBarCom(
        title: "Insights",
        bacGroundColor: Colors.white,
        action: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(6.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
              child: Row(
                children: [
                  Text(
                    "Upgrade",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Icon(
                    Icons.lock_open,
                    size: 16.sp,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 13.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Column(
            children: [
              SizedBox(
                height: 12.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _valueCell(),
                          _valueCell(topTxt: "Total Expenses")
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        children: [
                          _valueCell(topTxt: "Total Purchases"),
                          _valueCell(topTxt: "Total Indirect Income")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.blue,
                            size: 17.sp,
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            "Last Month",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Current Bank Balances",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.arrow_drop_down_circle_rounded,
                            color: Colors.black,
                            size: 17.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              _emptyBoxWidget(),

              SizedBox(height: 20.h,),

               Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _pendingInvoiceCell(topTxt: "Last 5 Days",thumColor: Colors.cyan),
                          _pendingInvoiceCell(topTxt: "5-15 Days",thumColor: Colors.blue),
                          
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        children: [
                          _pendingInvoiceCell(topTxt: "15-30 Days",thumColor: const Color.fromARGB(255, 11, 2, 182)),
                          _pendingInvoiceCell(topTxt: "30+ Days",thumColor: Colors.pink),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              _emptyBoxWidget(topText: "Payments"),

              SizedBox(height: 40.h,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyBoxWidget({String? topText}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              topText ?? "Business Summary",
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.boxOpen,
                  size: 90.sp,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    "No Chart Data Available",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _pendingInvoiceCell({String? topTxt, String? bottomText, Color?thumColor}) {
    return Expanded(
      child: Padding(
        padding:  EdgeInsets.only(right: 12.w),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colorconst.cSecondaryGrey,width: 1.w),
            borderRadius: BorderRadius.circular(5.r)),
          child: Padding(
            padding:  EdgeInsets.all(5.0.r),
            child: Row(
              children: [
                   SizedBox(width: 7.w,),
                Container(height: 30.h,width: 6.w,
                decoration: BoxDecoration(
                  color: thumColor?? Colors.blue,
                  borderRadius: BorderRadius.circular(6.r)),
                ),
                   SizedBox(width: 12.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topTxt ?? "Total Sales",
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      bottomText ?? "₹ 0",
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _valueCell({String? topTxt, String? bottomText}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topTxt ?? "Total Sales",
            style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black54,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            bottomText ?? "₹ 0",
            style: TextStyle(
                fontSize: 17.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
