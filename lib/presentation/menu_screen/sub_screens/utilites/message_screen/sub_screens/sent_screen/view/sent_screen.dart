import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SentScreen extends StatelessWidget {
  const SentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: false, // Manage this state accordingly
                  onChanged: (bool? value) {
                    // Action for select all
                  },
                ),
                Text(
                  'Select All',
                  style: TextStyle(
                    fontSize: 16.sp, // Responsive font size
                    color: Colorconst.cBlack,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.grey,
                    size: 24.w, // Use ScreenUtil for icon size
                  ),
                  onPressed: () {
                    // Action for delete
                  },
                ),
              ],
            ),
            // Messages List
            Expanded(
              child: ListView(
                children: [
                  buildMessageItem(
                    name: 'Owner',
                    message: 'Sale',
                    date: '27/09/2024',
                    details:
                        'xian ingo\nDate - 2024-09-27\nInvoice No - 1\nAmount - 2500.00\nReceived Amount - 0.0',
                  ),
                  buildMessageItem(
                    name: 'xianinfo',
                    message:
                        'Thanks for your purchase with us.\nPurchase Details:',
                    date: '27/09/2024',
                    details:
                        'Date - 2024-09-27\nInvoice No - 1\nAmount - 2500.00\nReceived Amount - 0.0',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build each message item
  Widget buildMessageItem({
    required String name,
    required String message,
    required String date,
    required String details,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 8.h, horizontal: 16.w), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: false, // Manage state for each checkbox
                onChanged: (bool? value) {
                  // Action for individual checkbox
                },
              ),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp, // Responsive font size
                    color: Colorconst.cBlack,
                  ),
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp, // Responsive font size
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h), // Responsive spacing
          Text(
            message,
            style: TextStyle(
              fontSize: 14.sp, // Responsive font size
              color: Colorconst.cBlack,
            ),
          ),
          SizedBox(height: 2.h), // Responsive spacing
          Text(
            details,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp, // Responsive font size
            ),
          ),
        ],
      ),
    );
  }
}
