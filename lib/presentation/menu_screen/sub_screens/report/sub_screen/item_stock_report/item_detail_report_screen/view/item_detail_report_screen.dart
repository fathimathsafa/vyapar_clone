import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
import 'package:vyapar_clone/core/common/widget/pdf_icon_widget.dart';
import 'package:vyapar_clone/core/common/widget/xls_option_bottom_sheet.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailReportScreen extends StatelessWidget {
  const ItemDetailReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        title: const Text(' Item Detail Report',
            style: TextStyle(color: Colorconst.cwhite)),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colorconst.cwhite,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: Colors.red),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const PdfOptionsBottomSheet(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colors.green),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const XlsOptionsBottomSheet(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          DateDropdownAndPicker(),
          Divider(),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text(
                'Hide inactive Dates ',
                style: TextStyle(fontSize: 14.sp, color: Colorconst.cGrey),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w, right: 6.w),
            child: Row(
              children: [
                Text(
                  "Item Name",
                  style: TextStyle(color: Colorconst.cBlue),
                ),
                SizedBox(
                  width: 20.w,
                ),
                SizedBox(
                    width: 170.w,
                    child: TextFormField(
                      initialValue: 'Enter Name', // Pre-filled text
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colorconst.cBlack, // Black color for text
                      ),
                      decoration: InputDecoration(
                        isDense: true, // Reduce padding
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Date',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colorconst.cGrey,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                'Sale Qty',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colorconst.cGrey,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                'Purchase Qty',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colorconst.cGrey,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                'Adjust Qty',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colorconst.cGrey,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                'Closing Qty',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colorconst.cGrey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
