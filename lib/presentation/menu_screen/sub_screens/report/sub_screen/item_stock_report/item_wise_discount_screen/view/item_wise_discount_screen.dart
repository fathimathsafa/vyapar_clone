import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
import 'package:vyapar_clone/core/common/widget/pdf_icon_widget.dart';
import 'package:vyapar_clone/core/common/widget/xls_option_bottom_sheet.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWiseDiscountScreen extends StatelessWidget {
  final ValueNotifier<String> dropdownValueNotifier =
      ValueNotifier<String>('Uncategorized');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        title: const Text('Item Wise Discount',
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
                builder: (_) => PdfOptionsBottomSheet(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colors.green),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => XlsOptionsBottomSheet(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          DateDropdownAndPicker(),
          Divider(),
          IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(left: 6.w, right: 6.w),
              child: Row(
                children: [
                  Text(
                    "Item Name",
                    style: TextStyle(
                      color: Colorconst.cBlue,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                      width: 70.w,
                      child: TextFormField(
                        initialValue: 'Item Name', // Pre-filled text
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colorconst.cBlack, // Black color for text
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none, // No border
                          isDense: true, // Reduce padding
                        ),
                      )),
                  const VerticalDivider(color: Colors.grey),
                  Text(
                    "Item Category",
                    style: TextStyle(
                      color: Colorconst.cBlue,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  DropdownButtonHideUnderline(
                    child: ValueListenableBuilder<String>(
                      valueListenable: dropdownValueNotifier,
                      builder: (context, value, child) {
                        return DropdownButton<String>(
                          value: value,
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.black),
                          items: <String>[
                            "All",
                            'Uncategorized',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: Colorconst.cBlack, fontSize: 12.sp),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              dropdownValueNotifier.value = newValue;
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Row(
            children: [
              Text(
                "Party Name",
                style: TextStyle(
                  color: Colorconst.cBlue,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                  width: 120.w,
                  child: TextFormField(
                    initialValue: 'Party Name', // Pre-filled text
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colorconst.cBlack, // Black color for text
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none, // No border
                      isDense: true, // Reduce padding
                    ),
                  )),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_drop_down_sharp)),
            ],
          ), // Use custom widget
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 250.w),
            child: Text(
              "Summary",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colorconst.cBlack, // Black color for text
              ),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Total Sale Amount",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colorconst.cBlack, // Black color for text
                ),
              ),
              Text(
                "₹ 0.0",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,

                  color: Colorconst.cBlack, // Black color for text
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Total Discount Amount",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colorconst.Green, // Black color for text
                ),
              ),
              Text(
                "+₹0.0",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,

                  color: Colorconst.Green, // Black color for text
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          )
        ],
      ),
    );
  }
}
