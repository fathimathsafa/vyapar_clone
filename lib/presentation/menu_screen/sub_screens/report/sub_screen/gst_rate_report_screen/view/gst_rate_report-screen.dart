import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';

class GstRateReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'GST Rate Report',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
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
                DateDropdownAndPicker(),
                const Divider(),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax Rate',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('Tax\nPercent',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text('Tax In',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    Text(
                      'Tax Out',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
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
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                SizedBox(
                  width: 80,
                ),
                Text('₹ 0.00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                Text('₹ 0.00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          Divider(),
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
