import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/common/widget/verticle_divider.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class DateExpenseInvoiceWidget extends StatelessWidget {
  DateExpenseInvoiceWidget({super.key, this.invoiceNumber, this.date,this.titleOne,this.titleTwo,this.onTapDate});
  final String? invoiceNumber;
  final String? date;
  final String? titleOne;
  final String? titleTwo;
  final Function()? onTapDate;

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const VerticleDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .015),
            child: Row(
              children: [
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     titleOne?? "Invoce No.",
                      style: interFontBlack(context, color: Colorconst.cGrey,fontsize: 15.sp),
                    ),
                    SizedBox(
                      height: screenHeight * .0009,
                    ),
                    Row(
                      children: [
                        Text(
                          invoiceNumber ?? "",
                          style:
                              interFontBlack(context, color: Colorconst.cBlack,fontsize: 15.sp),
                        ),
                        SizedBox(
                          width: screenWidth * .009,
                        ),
                        Transform.rotate(
                            angle: -1.55,
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 13.sp,
                              color: Colors.black45,
                            )),
                      ],
                    ),
                  ],
                )),
                Container(
                  height: screenHeight * .04,
                  width: 1,
                  color: Colors.black12,
                ),
                SizedBox(
                  width: screenWidth * .03,
                ),
                Flexible(
                    child: InkWell(
                  onTap: onTapDate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       titleTwo?? "Date",
                        style: interFontBlack(context, color: Colorconst.cGrey,fontsize: 15.sp),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Text(
                            date ?? "9/20/2024",
                            style: interFontBlack(context,
                                color: Colorconst.cBlack,fontsize: 15.sp),
                          ),
                          SizedBox(
                            width: screenWidth * .009,
                          ),
                          Transform.rotate(
                              angle: -1.55,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 13.sp,
                                color: Colors.black45,
                              ))
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * .01,
          ),
        ],
      ),
    );
  }
}