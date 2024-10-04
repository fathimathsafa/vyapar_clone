import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/filtter_bottom-sheet_widget/controller/filtter_bottom_sheet_controller.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class FilterBottomSheet extends StatelessWidget {
  // Initialize the controller
  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0.w),
      height: 420.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colorconst.cBlack),
              ),
              IconButton(
                onPressed: () {
                  Get.back(); // Close the bottom sheet using GetX
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(),

          // By Item Category Section
          Text(
            'By Item Category',
            style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
          ),
          SizedBox(height: 8.h),

          // Use Obx to listen to changes in selectedItemCategory
          Obx(() => Column(
                children: [
                  RadioListTile<String>(
                    value: 'All',
                    groupValue: filterController.selectedItemCategory.value,
                    onChanged: (value) {
                      filterController.selectedItemCategory.value = value!;
                    },
                    title: Text(
                      'All',
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                    ),
                    activeColor: Colorconst.cBlue,
                  ),
                  RadioListTile<String>(
                    value: 'Uncategorized',
                    groupValue: filterController.selectedItemCategory.value,
                    onChanged: (value) {
                      filterController.selectedItemCategory.value = value!;
                    },
                    title: Text(
                      'Uncategorized',
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                    ),
                    activeColor: Colorconst.cBlue,
                  ),
                ],
              )),
          SizedBox(height: 16.0),

          // By Status Section
          Text(
            'By Status',
            style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
          ),
          SizedBox(height: 8.h),

          // Use Obx to listen to changes in selectedStatus
          Obx(() => Column(
                children: [
                  RadioListTile<String>(
                    value: 'All',
                    groupValue: filterController.selectedStatus.value,
                    onChanged: (value) {
                      filterController.selectedStatus.value = value!;
                    },
                    title: Text(
                      'All',
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                    ),
                    activeColor: Colorconst.cBlue,
                  ),
                  RadioListTile<String>(
                    value: 'Active',
                    groupValue: filterController.selectedStatus.value,
                    onChanged: (value) {
                      filterController.selectedStatus.value = value!;
                    },
                    title: Text(
                      'Active',
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                    ),
                    activeColor: Colorconst.cBlue,
                  ),
                  RadioListTile<String>(
                    value: 'In-Active',
                    groupValue: filterController.selectedStatus.value,
                    onChanged: (value) {
                      filterController.selectedStatus.value = value!;
                    },
                    title: Text(
                      'In-Active',
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                    ),
                    activeColor: Colorconst.cBlue,
                  ),
                ],
              )),

          Spacer(),

          // Reset and Apply Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                height: 40.h,
                minWidth: 120.w,
                shape: StadiumBorder(),
                color: Colorconst.cGrey2,
                onPressed: () {
                  // Reset the filters using the controller
                  // filterController.resetFilters();
                },
                child: Text(
                  'Reset',
                  style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
                ),
              ),
              MaterialButton(
                height: 40.h,
                minWidth: 120.w,
                shape: StadiumBorder(),
                color: Colorconst.cRed,
                onPressed: () {
                  // Reset the filters using the controller
                  Get.back();
                },
                child: Text(
                  'Apply',
                  style: TextStyle(color: Colorconst.cwhite, fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
