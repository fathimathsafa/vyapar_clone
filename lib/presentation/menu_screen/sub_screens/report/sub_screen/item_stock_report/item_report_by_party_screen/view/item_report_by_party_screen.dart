import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/common/context_provider.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
import 'package:vyapar_clone/core/common/widget/pdf_icon_widget.dart';
import 'package:vyapar_clone/core/common/widget/xls_option_bottom_sheet.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/view/item_details_screen.dart';

class ItemReportBypartyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        title: Text("Item Report By Party",
            // 'Order Transaction',
            style: TextStyle(color: Colorconst.cBlack)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date Range and Filters
          DateDropdownAndPicker(),

          const Divider(),

          // Party Name Filter
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
            child: Row(
              children: [
                Text('Party Name',
                    style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlue)),
                SizedBox(
                  width: 100.w,
                ),
                Text('Sort by',
                    style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlue)),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
            child: Row(
              children: [
                SizedBox(
                    width: 80.w,
                    child: TextFormField(
                      initialValue: 'All Parties', // Pre-filled text
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colorconst.cBlack, // Black color for text
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none, // No border
                        isDense: true, // Reduce padding
                      ),
                    )),
                SizedBox(
                  width: 100.w,
                ),
                DropdownButton<String>(
                  value: 'Name',
                  items: <String>['Name', 'Sale Quantity ', "Purchase Quantity"]
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          )),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Add functionality for dropdown
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          // Table Headers
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Item Name',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colorconst.cGrey,
                      decoration: TextDecoration.underline,
                    )),
                Text('Sale Qty',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colorconst.cGrey,
                      decoration: TextDecoration.underline,
                    )),
                Text('Purchase qty',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colorconst.cGrey,
                      decoration: TextDecoration.underline,
                    )),
              ],
            ),
          ),
          // Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Example data length
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0.w,
                      vertical: 4.0.h), // Both horizontal and vertical
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemDetailsScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Item $index',
                            style: TextStyle(color: Colors.black)),
                        Text('0.0', style: TextStyle(color: Colors.black)),
                        Text('₹0.00', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Total Section
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colorconst.cBlack)),
              Text('0.0',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colorconst.cBlack)),
              Text('₹0.00',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colorconst.cBlack)),
            ],
          ),
        ],
      ),
    );
  }
}
