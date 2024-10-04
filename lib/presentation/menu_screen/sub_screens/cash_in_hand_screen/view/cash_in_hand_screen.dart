import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/cash_in_hand_screen/controller/cash_in%20hand_controller.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/cash_in_hand_screen/sub_screens/loading_screen/view/loading_screen.dart';

class CashInHand extends StatelessWidget {
  const CashInHand({super.key});

  @override
  Widget build(BuildContext context) {
    final CashInHandController controller = Get.put(CashInHandController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash In-Hand'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // GetX handles navigation
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 100,
                width: 400,
                padding: const EdgeInsets.only(top: 25),
                decoration: BoxDecoration(color: Colors.green[50]),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Current Cash Balance',
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '₹ ${controller.currentCashBalance.value.toString()}',
                            style: const TextStyle(color: Colors.green),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Transaction details (if any)
            Obx(() {
              if (controller.hasTransactions.value) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Transaction Details',
                            style: TextStyle(color: Colors.black)),
                        Text('Amount', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    const Divider(),
                    // Example transactions, replace with your actual data
                    TransactionItem(
                        description: 'Payment-in-Gokul',
                        amount: '1.00',
                        date: '24 Sept 2024'),
                    const Divider(),
                    TransactionItem(
                        description: 'Sale-Gokul',
                        amount: '10.00',
                        date: '12 Sept 2024'),
                    const Divider(),
                  ],
                );
              } else {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/animation/cashinhand.json', // Replace with your image path
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Hey! You have not added any cash transaction yet.\nAny transaction involving cash appears here.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => const LoadingScreen()); // GetX navigation
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.red),
                      ),
                    ),
                    child: const Text(
                      'Bank Transfer',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showAdjustCashBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      'Adjust Cash',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget TransactionItem(
      {required String description,
      required String amount,
      required String date}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(description, style: const TextStyle(color: Colors.black)),
            Text(amount, style: const TextStyle(color: Colors.green)),
          ],
        ),
        Row(
          children: [Text(date, style: const TextStyle(color: Colors.grey))],
        ),
      ],
    );
  }

  // Bottom sheet with radio buttons (converted to GetX)
  void _showAdjustCashBottomSheet(BuildContext context) {
    Get.bottomSheet(
      GetBuilder<CashInHandController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Adjust Cash',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Obx(() => RadioListTile<int>(
                            title: const Text(
                              'Add Cash',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: 1,
                            groupValue: controller.selectedRadioValue.value,
                            onChanged: (value) {
                              controller.setSelectedRadio(value!);
                            },
                          )),
                    ),
                    Expanded(
                      child: Obx(() => RadioListTile<int>(
                            title: const Text(
                              'Reduce Cash',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: 2,
                            groupValue: controller.selectedRadioValue.value,
                            onChanged: (value) {
                              controller.setSelectedRadio(value!);
                            },
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Adjustment Date',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Amount',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Description(Optional)',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back(); // Close bottom sheet
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                      child: Obx(() => Text(
                          controller.selectedRadioValue.value == 1
                              ? 'Add Cash'
                              : 'Reduce Cash',
                          style: const TextStyle(color: Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
