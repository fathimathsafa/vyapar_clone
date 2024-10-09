import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/all_party_report_controller.dart'; // Import the controller

class AllPartyReportsScreen extends StatelessWidget {
  final AllPartyReportController controller =
      Get.put(AllPartyReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        title: const Text(
          "Party Report",
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
              // Add PDF export logic here
            },
          ),
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colorconst.Green),
            onPressed: () {
              // Add Excel export logic here
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          children: [
            Card(
              color: Colorconst.cGrey2,
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Row(
                  children: [
                    Obx(() => Checkbox(
                          value: controller.isChecked.value,
                          onChanged: (bool? value) {
                            controller.isChecked.value = value ?? false;
                          },
                        )),
                    Text(
                      "Date Filter",
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                    ),
                    SizedBox(width: 80.w),
                    GestureDetector(
                      onTap: controller.isChecked.value
                          ? () {
                              controller.selectDate(context);
                            }
                          : null,
                      child: Obx(
                        () => Row(
                          children: [
                            Text(
                              "Date",
                              style: TextStyle(
                                  color: Colorconst.cBlack, fontSize: 14.sp),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              controller.selectedDate.value,
                              style: TextStyle(
                                  color: Colorconst.cBlack, fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Sort By",
                  style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                ),
                Text(
                  "Show",
                  style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => DropdownButton<String>(
                    value: controller.selectedParty.value,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 30.sp,
                    ),
                    onChanged: (String? newValue) {
                      controller.selectedParty.value = newValue!;
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
                  ),
                ),
                Obx(
                  () => DropdownButton<String>(
                    value: controller.selectedSort.value,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 30.sp,
                    ),
                    onChanged: (String? newValue) {
                      controller.selectedSort.value = newValue!;
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
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Obx(() => Checkbox(
                      value: controller.isZeroBalanceChecked.value,
                      onChanged: (bool? value) {
                        controller.isZeroBalanceChecked.value = value ?? false;
                      },
                    )),
                Text(
                  " Show 0 balance party",
                  style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                ),
              ],
            ),
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
                Text(
                  "Credit Limit",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colorconst.cGrey,
                      fontSize: 14.sp),
                ),
                Text(
                  "Balance",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colorconst.cGrey,
                      fontSize: 14.sp),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Party $index",
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 14.sp),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 14.sp),
                        ),
                        Text(
                          "\- ₹${(index + 1) * 500}",
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 14.sp),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
