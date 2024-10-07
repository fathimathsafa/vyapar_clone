import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/sub_screens/edit_unit_screen/controller/edit_unit_controller.dart';

class EditUnitScreen extends StatelessWidget {
  final EditUnitController controller = Get.put(EditUnitController());

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Unit',
          style: TextStyle(color: Colorconst.cBlack),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w), // Use responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Primary Unit Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Primary Unit',
                hintText: "BUNDLES(Bdl)",
                labelStyle: TextStyle(color: Colorconst.cBlack),
                border: OutlineInputBorder(),
              ),
              items: controller.primaryUnits.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colorconst.cBlack),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle primary unit change (add logic if needed)
              },
            ),
            SizedBox(height: 20.h), // Use responsive height

            // Secondary Unit Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Secondary Unit',
                border: OutlineInputBorder(),
              ),
              items: controller.secondaryUnits.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colorconst.cBlack),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Update secondary unit and toggle conversion rate visibility
                controller.onSecondaryUnitChanged(newValue);
              },
            ),
            SizedBox(height: 20.h), // Use responsive height

            // Text label for conversion rate
            Text(
              'Select Conversion Rate',
              style: TextStyle(
                color: Colorconst.cBlack,
                fontSize: 16.sp, // Use responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h), // Add spacing

            // Observe the controller's state for showing conversion rate section
            Obx(() {
              if (controller.showConversionRate.value) {
                return Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {},
                    ),
                    Text(
                      '1 BUNDLES  = ',
                      style: TextStyle(
                        color: Colorconst.cBlack,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      width: 70.w,
                      child: TextFormField(
                        style: TextStyle(color: Colorconst.cBlack),
                        controller: controller.conversionRateController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '0.0',
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Obx(() => Text(
                          controller.selectedSecondaryUnit.value,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colorconst.cBlack,
                          ),
                        )),
                  ],
                );
              } else {
                return SizedBox(); // Empty widget if not showing
              }
            }),

            Spacer(), // Push the buttons to the bottom
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.h),
        child: Row(
          children: [
            // Delete Button
            Expanded(
              child: TextButton(
                onPressed: () {
                  // Handle delete action using the controller
                },
                child: Text(
                  'Delete',
                  style: TextStyle(
                    color: Colorconst.cBlack,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w), // Space between buttons

            // Save Button
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save action using the controller
                  controller.onSave();
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
