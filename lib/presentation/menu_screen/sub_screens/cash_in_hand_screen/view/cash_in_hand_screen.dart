import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:lottie/lottie.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/cash_in_hand_screen/sub_screens/loading_screen/view/loading_screen.dart';

class CashInHand extends StatelessWidget {
  const CashInHand({super.key});

  @override
  Widget build(BuildContext context) {
    // Example: Check if there are any transactions (you can replace this with actual data)
    // bool hasTransactions = false; // Change this to true if transactions exist

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash In-Hand'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
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
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Cash Balance',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '₹ 11.00',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // if (hasTransactions) ...[
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: const [
            //       Text('Transaction Details',
            //           style: TextStyle(color: Colors.black)),
            //       Text('Amount', style: TextStyle(color: Colors.black)),
            //     ],
            //   ),
            //   const Divider(),
            //   // Example transactions, replace with your actual data
            //   TransactionItem(
            //       description: 'Payment-in-Gokul',
            //       amount: '1.00',
            //       date: '24 Sept 2024'),
            //   const Divider(),
            //   TransactionItem(
            //       description: 'Sale-Gokul',
            //       amount: '10.00',
            //       date: '12 Sept 2024'),
            //   const Divider(),
            // ] else ...[
            // No transactions UI
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animation/cashinhand.json', // Replace with your image path
                      width: 100,
                      height: 100,
                      // Adjust size as needed
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
            ),
            // ],
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const LoadingScreen(), // Navigate to the loading screen
                        ),
                      );
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
                      _showAdjustCashBottomSheet(context); // Show bottom sheet
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

  // Transaction Item Widget
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

  // Function to show bottom sheet
  void _showAdjustCashBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        int? selectedValue = 1; // Initial radio value
        return StatefulBuilder(
          builder: (context, setState) {
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
                        child: RadioListTile<int>(
                          title: const Text(
                            'Add Cash',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: 1,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<int>(
                          title: const Text(
                            'Reduce Cash',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: 2,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Adjustment Date',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Amount',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Description(Optional)',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close bottom sheet on press
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
                        child: Text(
                          selectedValue == 1 ? 'Add Cash' : 'Reduce Cash',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
