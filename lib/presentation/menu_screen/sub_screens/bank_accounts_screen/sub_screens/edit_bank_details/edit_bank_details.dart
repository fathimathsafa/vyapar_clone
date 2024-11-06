import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/bank_accounts_screen/sub_screens/add_bank_accont_screen/view/controller.dart';

class EditBankAccount extends StatelessWidget {
  final AddBankAccountController controller =
      Get.put(AddBankAccountController());
  final bool editMode;

  // Constructor to set editMode and initialize fields with existing data
  EditBankAccount({this.editMode = false}) {
    if (editMode) {
      controller.accountDisplayNameController.text = "Gokul";
      controller.openingBalanceController.text = "1000.00";
      controller.asOfDateController.text = "30/10/2024";
      controller.printBankDetails.value =
          true; // Set to true to show account details fields
      controller.printUPIQR.value =
          true; // Set to true if UPI QR Code should be visible

      // Pre-fill additional bank details
      controller.accountHolderNameController.text = "Account Holder Name";
      controller.accountNumberController.text = "123456789";
      controller.ifscCodeController.text = "SBIN0001234";
      controller.branchNameController.text = "Edappal";
      controller.upiIDController.text = "account@upi";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          editMode ? 'Edit Bank Account' : 'Add Bank Account',
          style: const TextStyle(color: Colorconst.cBlack),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.all(16.0.w),
              color: Colorconst.cwhite,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.accountDisplayNameController,
                    style: const TextStyle(color: Colorconst.cBlack),
                    decoration: const InputDecoration(
                      labelText: "Bank Name/ Account Display Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 25.w),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.openingBalanceController,
                          style: const TextStyle(color: Colorconst.cBlack),
                          decoration: const InputDecoration(
                            labelText: "Opening Balance",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: TextFormField(
                          controller: controller.asOfDateController,
                          style: const TextStyle(color: Colorconst.cBlack),
                          decoration: const InputDecoration(
                            labelText: "As On",
                            suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(),
                          ),
                          readOnly: true,
                          onTap: () => controller.selectDate(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.all(10.0.w),
              color: Colorconst.cwhite,
              child: Column(
                children: [
                  Obx(() => ListTile(
                        title: Text(
                          "Print bank details on invoices",
                          style: TextStyle(
                              color: Colorconst.cBlack, fontSize: 14.sp),
                        ),
                        trailing: Switch(
                          value: controller.printBankDetails.value,
                          onChanged: (bool value) {
                            controller.printBankDetails.value = value;
                          },
                        ),
                        leading: const Icon(Icons.info_outline),
                      )),
                  Obx(() => ListTile(
                        title: Text(
                          "Print UPI QR Code on invoices",
                          style: TextStyle(
                              color: Colorconst.cBlack, fontSize: 14.sp),
                        ),
                        trailing: Switch(
                          value: controller.printUPIQR.value,
                          onChanged: (bool value) {
                            controller.printUPIQR.value = value;
                          },
                        ),
                        leading: const Icon(Icons.info_outline),
                      )),
                  Obx(() {
                    if (controller.printBankDetails.value) {
                      return Column(
                        children: [
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: controller.accountHolderNameController,
                            style: const TextStyle(color: Colorconst.cBlack),
                            decoration: const InputDecoration(
                              labelText: "Account Holder Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: controller.accountNumberController,
                            style: const TextStyle(color: Colorconst.cBlack),
                            decoration: const InputDecoration(
                              labelText: "Account Number",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: controller.ifscCodeController,
                            style: const TextStyle(color: Colorconst.cBlack),
                            decoration: const InputDecoration(
                              labelText: "IFSC Code",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: controller.branchNameController,
                            style: const TextStyle(color: Colorconst.cBlack),
                            decoration: const InputDecoration(
                              labelText: "Branch Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
                  Obx(() {
                    if (controller.printUPIQR.value) {
                      return Column(
                        children: [
                          SizedBox(height: 20.h),
                          TextFormField(
                            controller: controller.upiIDController,
                            style: const TextStyle(color: Colorconst.cBlack),
                            decoration: const InputDecoration(
                              labelText: "UPI ID for QR Code",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          color: Colorconst.cRed,
          onPressed: () {
            // Update functionality for the edit mode
          },
          child: Text(
            editMode ? 'Update' : 'Save',
            style: TextStyle(fontSize: 14.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
