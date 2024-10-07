import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/p2p_transfer_screen/controller/p2p_transfer_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PartyToPartyTransferScreen extends StatelessWidget {
  final PartyTransferController controller =
      Get.put(PartyTransferController()); // Instantiate the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colorconst.cBlack,
          ),
        ),
        title: Text(
          'Party To Party Transfer',
          style: TextStyle(color: Colorconst.cBlack),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date Picker
                  Row(
                    children: [
                      Text(
                        'Date:',
                        style: TextStyle(
                            color: Colorconst.cBlack, fontSize: 15.sp),
                      ),
                      SizedBox(width: 10.w),
                      Obx(() => InkWell(
                            onTap: () => controller.selectDate(context),
                            child: Text(
                              "${controller.selectedDate.value.toLocal()}"
                                  .split(' ')[0],
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.blue),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Party 1 Dropdown and Amount input
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colorconst.cwhite,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        Obx(() => DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Party *',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                ),
                                value:
                                    controller.selectedParty1.value.isNotEmpty
                                        ? controller.selectedParty1.value
                                        : null,
                                onChanged:
                                    null, // Disable default dropdown behavior
                                icon: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _showPartySelectionBottomSheet(
                                            context, controller);
                                      },
                                    );
                                  },
                                  child: Icon(Icons.arrow_drop_down),
                                ),
                                items: controller.parties
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Obx(() => ToggleButtons(
                                  borderRadius: BorderRadius.circular(10),
                                  constraints: BoxConstraints(
                                    minHeight: 30,
                                    minWidth: 80,
                                  ),
                                  isSelected: [
                                    controller.isReceived
                                        .value, // Toggle state for "Received"
                                    !controller.isReceived
                                        .value, // Toggle state for "Paid"
                                  ],
                                  onPressed: (int index) {
                                    controller.isReceived.value =
                                        index == 0; // Toggle state
                                  },
                                  fillColor: controller.isReceived.value
                                      ? Colors.green
                                      : Colors.red,
                                  selectedColor: Colors.white,
                                  color: Colors.black,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text('Received'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text('Paid'),
                                    ),
                                  ],
                                )),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colorconst.cBlack),
                                decoration: InputDecoration(
                                  hintText: 'Amount',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Party 2 Dropdown and Amount input
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colorconst.cwhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Obx(() => DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Party *',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                ),
                                value:
                                    controller.selectedParty2.value.isNotEmpty
                                        ? controller.selectedParty2.value
                                        : null,
                                onChanged:
                                    null, // Disable default dropdown behavior
                                icon: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _showPartySelectionBottomSheet(
                                            context, controller);
                                      },
                                    );
                                  },
                                  child: Icon(Icons.arrow_drop_down),
                                ),
                                items: controller.parties
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Obx(() => ToggleButtons(
                                  borderRadius: BorderRadius.circular(10),
                                  constraints: BoxConstraints(
                                    minHeight: 30,
                                    minWidth: 80,
                                  ),
                                  isSelected: [
                                    controller.isReceived
                                        .value, // Toggle state for "Received"
                                    !controller.isReceived
                                        .value, // Toggle state for "Paid"
                                  ],
                                  onPressed: (int index) {
                                    controller.isReceived.value =
                                        index == 0; // Toggle state
                                  },
                                  fillColor: controller.isReceived.value
                                      ? Colors.green
                                      : Colors.red,
                                  selectedColor: Colors.white,
                                  color: Colors.black,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text('Received'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text('Paid'),
                                    ),
                                  ],
                                )),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colorconst.cBlack),
                                decoration: InputDecoration(
                                  hintText: 'Amount',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // Note and Image Upload
                  Container(
                    color: Colorconst.cwhite,
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: 'Add Note',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            IconButton(
                              onPressed: () {
                                // Handle image upload
                              },
                              icon: Icon(
                                Icons.add_photo_alternate,
                                color: Colorconst.cBlue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Row for Save & New and Save buttons
          Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 13.h), // Use ScreenUtil
                    child: Center(
                        child: Text(
                      "Save & New",
                      style: interFontGrey(context),
                    )),
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {},
                child: Container(
                  color: Colorconst.cBlue,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 13.h), // Use ScreenUtil
                    child: Center(
                        child: Text(
                      "Save",
                      style: interFontGrey(context),
                    )),
                  ),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

  // Bottom Sheet to show saved items and option to add new party
  Widget _showPartySelectionBottomSheet(
      BuildContext context, PartyTransferController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Makes the bottom sheet size dynamic
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Party 1:"),
              Obx(() => Text(controller.selectedParty1.value)),
            ],
          ),
          onTap: () {
            Get.back(); // Close the bottom sheet
            // Open another bottom sheet for selecting parties
          },
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Party 2:"),
              Obx(() => Text(controller.selectedParty2.value)),
            ],
          ),
          onTap: () {
            Get.back(); // Close the bottom sheet
            // Open another bottom sheet for selecting parties
          },
        ),
      ],
    );
  }
}
