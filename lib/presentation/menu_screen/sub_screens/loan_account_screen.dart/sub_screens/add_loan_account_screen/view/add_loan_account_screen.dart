import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/loan_account_screen.dart/controller/add_loan_statement_controller.dart';

class AddLoanAccountPage extends StatelessWidget {
  final AddLoanAccountController controller =
      Get.put(AddLoanAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Add Loan Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button action
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Account Name
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Account Name *',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Account Number
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Account Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Lender Bank
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Lender Bank',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Opening Balance and Date
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Opening Balance',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Obx(() => TextField(
                              controller: controller.dateController.value,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: 'Balance as of',
                                suffixIcon: Icon(Icons.calendar_today),
                                border: OutlineInputBorder(),
                              ),
                              onTap: () {
                                controller.selectDate(context);
                              },
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Loan Received In (Dropdown)
                  Obx(() => DropdownButtonFormField<String>(
                        value: controller.selectedLoanType.value,
                        decoration: const InputDecoration(
                          labelText: 'Loan Received in',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Cash', 'Add Bank A/c']
                            .map((type) => DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(type),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          controller.selectedLoanType.value = newValue!;
                        },
                      )),
                  const SizedBox(height: 16),

                  // Interest Rate and Duration
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Interest Rate %',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Duration (Months)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Processing Fee
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Processing Fee',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Save Button fixed at the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle Save action
                },
                child: const Text('Save'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
