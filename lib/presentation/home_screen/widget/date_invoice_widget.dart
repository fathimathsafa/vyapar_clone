import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:vyapar_clone/core/common/widget/verticle_divider.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class DateInvoiceWidget extends StatelessWidget {
  DateInvoiceWidget({super.key, this.invoiceNumber, this.date});
  final String? invoiceNumber;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const VerticleDivider(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 15.w), // ScreenUtil for padding
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Invoice No.",
                        style: interFontBlack(context,
                            color: Colorconst.cGrey, fontsize: 15.sp),
                      ),
                      SizedBox(
                        height: 9.h, // Responsive height using ScreenUtil
                      ),
                      Row(
                        children: [
                          Text(
                            invoiceNumber ?? "",
                            style: interFontBlack(context,
                                color: Colorconst.cBlack, fontsize: 15.sp),
                          ),
                          SizedBox(
                            width: 9.w, // Responsive width using ScreenUtil
                          ),
                          Transform.rotate(
                            angle: -1.55,
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 13.sp, // Scalable icon size
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.h, // Responsive height
                  width: 1.w, // Responsive width
                  color: Colors.black12,
                ),
                SizedBox(
                  width: 30.w, // Responsive space between elements
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: interFontBlack(context,
                              color: Colorconst.cGrey, fontsize: 15.sp),
                        ),
                        SizedBox(
                          height: 4.h, // Responsive height
                        ),
                        Row(
                          children: [
                            Text(
                              date ?? "9/20/2024",
                              style: interFontBlack(context,
                                  color: Colorconst.cBlack, fontsize: 15.sp),
                            ),
                            SizedBox(
                              width: 9.w, // Responsive width
                            ),
                            Transform.rotate(
                              angle: -1.55,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 13.sp, // Scalable icon size
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h, // Responsive height for spacing
          ),
        ],
      ),
    );
  }
}
