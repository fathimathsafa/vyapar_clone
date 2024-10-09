import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/all_party_reports/controller/all_party_report_controller.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/party_report_by_item_screen/controller/party_report_controller.dart';

class PartyReportByItemsScreen extends StatelessWidget {
  // Create the controller using GetX
  final PartyReportByItemsController controller =
      Get.put(PartyReportByItemsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        title: const Text(
          "Party Report By Items",
          style: TextStyle(
            color: Colorconst.cwhite,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colorconst.cwhite,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.picture_as_pdf,
              color: Colorconst.cRed,
            ),
            onPressed: () {
              // PDF Export Clicked
            },
          ),
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colorconst.Green),
            onPressed: () {
              // Excel Export Clicked
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date filter row with "This Month" text
            DateDropdownAndPicker(),
            const Divider(),

            // Category and Sort By row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: TextStyle(color: Colorconst.cBlue, fontSize: 14.sp),
                ),
                Text(
                  "Sort By",
                  style: TextStyle(color: Colorconst.cBlue, fontSize: 14.sp),
                ),
              ],
            ),

            // Dropdowns for Category and Sort By
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => DropdownButton<String>(
                      value: controller.selectedParty.value,
                      icon: Icon(Icons.arrow_drop_down, size: 30.sp),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.updateSelectedParty(newValue);
                        }
                      },
                      items: controller.partyTypes
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Colorconst.cBlack, fontSize: 14.sp),
                          ),
                        );
                      }).toList(),
                    )),
                Obx(() => DropdownButton<String>(
                      value: controller.selectedSort.value,
                      icon: Icon(Icons.arrow_drop_down, size: 30.sp),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.updateSelectedSort(newValue);
                        }
                      },
                      items: controller.sortOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Colorconst.cBlack, fontSize: 14.sp),
                          ),
                        );
                      }).toList(),
                    )),
              ],
            ),
            const Divider(),

            // Text field for entering the item name
            Text(
              "Enter Item Name",
              style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'All Items',
                border: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // Headers for the party list
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Party Name",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colorconst.cGrey,
                      fontSize: 14.sp),
                ),
                SizedBox(width: 10.w),
                Text(
                  "Sale qty",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colorconst.cGrey,
                      fontSize: 14.sp),
                ),
                Text(
                  "Purchase qty",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colorconst.cGrey,
                      fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(height: 10.h),

            // List of parties
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Number of party items
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Party $index",
                              style: TextStyle(
                                  color: Colorconst.cBlack, fontSize: 14.sp),
                            ),
                            Text(
                              "2.0",
                              style: TextStyle(
                                  color: Colorconst.cBlack, fontSize: 14.sp),
                            ),
                            Text(
                              "0.0",
                              style: TextStyle(
                                  color: Colorconst.cBlack, fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      if (index < 5) SizedBox(height: 10.h),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(),

            // Total row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Text(
                  "Total",
                  style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
                ),
                SizedBox(width: 50.w),
                Text(
                  "2.0",
                  style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
                ),
                SizedBox(width: 15.w),
                Text(
                  "0.0",
                  style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
