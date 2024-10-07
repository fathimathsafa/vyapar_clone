import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/home_screen/sub_screens/p2p_transfer_screen/controller/p2p_transfer_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PartyToPartyTransferScreen extends StatelessWidget {
  final PartyTransferController controller =
      Get.put(PartyTransferController()); // Instantiate the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colorconst.cBlack,
            )),
        title: Text(
          'Party To Party Transfer',
          style: TextStyle(color: Colorconst.cBlack),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Date Picker
            Row(
              children: [
                Text('Date:'),
                SizedBox(width: 10),
                Obx(() => InkWell(
                      onTap: () => controller.selectDate(context),
                      child: Text(
                        "${controller.selectedDate.value.toLocal()}"
                            .split(' ')[0], // Corrected part
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    )),
              ],
            ),
            SizedBox(height: 16),

            // Party 1 Dropdown and Amount input
            Row(
              children: [
                Expanded(
                  child: Obx(() => DropdownButtonFormField<String>(
                        hint: Text('Party *'),
                        value: controller.selectedParty1.value.isNotEmpty
                            ? controller.selectedParty1.value
                            : null,
                        onChanged: (String? newValue) {
                          controller.selectedParty1.value = newValue!;
                        },
                        items: ['Party 1', 'Party 2', 'Party 3']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ),
                SizedBox(width: 10),
                Obx(() => ToggleButtons(
                      isSelected: [
                        controller.isReceived.value,
                        !controller.isReceived.value
                      ],
                      onPressed: (int index) {
                        controller.isReceived.value = index == 0;
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text('Received'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text('Paid'),
                        ),
                      ],
                    )),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Party 2 Dropdown and Amount input
            Row(
              children: [
                Expanded(
                  child: Obx(() => DropdownButtonFormField<String>(
                        hint: Text('Party *'),
                        value: controller.selectedParty2.value.isNotEmpty
                            ? controller.selectedParty2.value
                            : null,
                        onChanged: (String? newValue) {
                          controller.selectedParty2.value = newValue!;
                        },
                        items: ['Party 1', 'Party 2', 'Party 3']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ),
                SizedBox(width: 10),
                Obx(() => ToggleButtons(
                      isSelected: [
                        !controller.isReceived.value,
                        controller.isReceived.value
                      ],
                      onPressed: (int index) {
                        controller.isReceived.value = index != 0;
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text('Received'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text('Paid'),
                        ),
                      ],
                    )),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Note and Image
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Add Note',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    // Handle image upload
                  },
                  icon: Icon(Icons.add_photo_alternate),
                ),
              ],
            ),
            Spacer(),

            // Save buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Save & New
                  },
                  child: Text('Save & New'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Save
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
