import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/cash_in_hand_screen/controller/add_bank_account_controller.dart';

class BankTransfer extends StatelessWidget {
  const BankTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final BankTransferController controller = Get.put(BankTransferController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bank Account'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Use GetX for navigation
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bank Name/Account Display Name
              TextFormField(
                onChanged: (value) => controller.bankName.value = value,
                decoration: InputDecoration(
                  labelText: "Bank Name/ Account Display Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  // Opening Balance
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) =>
                          controller.openingBalance.value = value,
                      decoration: InputDecoration(
                        labelText: "Opening Balance",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  // As On Date Picker
                  Expanded(
                    child: Obx(() => TextFormField(
                          readOnly: true,
                          onTap: controller.selectDate, // Handle date picker
                          decoration: InputDecoration(
                            labelText: "As On",
                            suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(),
                          ),
                          controller: TextEditingController(
                            text: controller.asOnDate.value,
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              // Print bank details toggle
              Obx(() => ListTile(
                    title: Text("Print bank details on invoices"),
                    trailing: Switch(
                      value: controller.printBankDetails.value,
                      onChanged: (value) {
                        controller.printBankDetails.value = value;
                      },
                    ),
                    leading: Icon(Icons.info_outline),
                  )),
              // Print UPI QR toggle
              Obx(() => ListTile(
                    title: Text("Print UPI QR Code on invoices"),
                    trailing: Switch(
                      value: controller.printUPIQR.value,
                      onChanged: (value) {
                        controller.printUPIQR.value = value;
                      },
                    ),
                    leading: Icon(Icons.info_outline),
                  )),
              // Conditional Bank Details
              Obx(() => controller.printBankDetails.value
                  ? Column(
                      children: [
                        SizedBox(height: 16),
                        TextFormField(
                          onChanged: (value) =>
                              controller.accountHolderName.value = value,
                          decoration: InputDecoration(
                            labelText: "Account Holder Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          onChanged: (value) =>
                              controller.accountNumber.value = value,
                          decoration: InputDecoration(
                            labelText: "Account Number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          onChanged: (value) =>
                              controller.ifscCode.value = value,
                          decoration: InputDecoration(
                            labelText: "IFSC Code",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          onChanged: (value) =>
                              controller.branchName.value = value,
                          decoration: InputDecoration(
                            labelText: "Branch Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    )
                  : Container()),
              // Conditional UPI QR
              Obx(() => controller.printUPIQR.value
                  ? Column(
                      children: [
                        SizedBox(height: 16),
                        TextFormField(
                          onChanged: (value) => controller.upiId.value = value,
                          decoration: InputDecoration(
                            labelText: "UPI ID for QR Code",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    )
                  : Container()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: controller.saveBankDetails, // Handle save button
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              'Save',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
