
import 'package:flutter/material.dart';

class BankStatement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Bank Statement',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add functionality for back navigation
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf, color: Colors.red),
            onPressed: () {
              // Add functionality for PDF export
            },
          ),
          IconButton(
            icon: Icon(Icons.table_chart, color: Colors.green),
            onPressed: () {
              // Add functionality for Excel export
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Date Range and Party Name
                IntrinsicHeight(
                  child: Row(
                    children: [
                      const Text(
                        "This Month",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.black),
                      ),
                      const VerticalDivider(thickness: 2, color: Colors.grey),
                      const SizedBox(width: 15),
                      const Row(
                        children: [
                          Icon(Icons.calendar_today, size: 16),
                          SizedBox(width: 4),
                          Text(
                            '01/09/2024 TO 30/09/2024',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bank name:',
                      style: TextStyle(color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('Description',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text(
                      'Withdrawal',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Text('Deposit',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('',
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text('Sale Tax', style: TextStyle(fontSize: 12)),
                        Text('',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text('Purchase/\nExpense Tax',
                        //     style: TextStyle(fontSize: 12)),
                        Text('',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          // Total Tax
          // Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Total Running balance:₹ 0.00',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                // Text('₹ 0.00',
                //     style: TextStyle(
                //         fontWeight: FontWeight.bold, color: Colors.black)),
                // Text('₹ 0.00',
                //     style: TextStyle(
                //         fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          // Divider(),
          // Promotional Banner
          // Container(
          //   color: Colors.blue[50],
          //   padding: EdgeInsets.all(8),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text('GST Filing starting at ₹2,999!',
          //           style: TextStyle(fontSize: 12, color: Colors.black)),
          //       ElevatedButton(
          //         onPressed: () {
          //           // Handle explore now button press
          //         },
          //         child: Text('Explore now',
          //             style: TextStyle(fontSize: 12, color: Colors.black)),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
