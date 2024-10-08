import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/loan_account_screen.dart/sub_screens/add_loan_account_screen/view/add_loan_account_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoanAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Loan Account', style: TextStyle(fontSize: 16)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Banner at the top
          Container(
            margin: EdgeInsets.all(16.0.w),
            padding: EdgeInsets.all(8.0.w),
            decoration: BoxDecoration(
              color: Colors.blue[50], // Background color for the banner
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Wrap the text Column in a Container with a specific width
                Container(
                  width: 200.w, // Set the desired width here
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'EXCLUSIVE ON Vyapar',
                      //   style: TextStyle(
                      //     color: Colors.orange,
                      //     fontSize: 10,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      SizedBox(height: 4.h),
                      Text(
                        'Business Loans up to 30 lakhs!',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Now avail loans with completely digital process, no\ncollateral and fast disbursal',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '1L+ loan applications',
                        style:
                            TextStyle(fontSize: 12.sp, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                // Adjusted button container to maintain alignment
                Column(
                  children: [
                    SizedBox(height: 50.h), // Adjust the height as needed
                    ElevatedButton(
                      onPressed: () {
                        // Handle Explore now button press
                      },
                      child: Text('Explore now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blueAccent, // Button background color
                        textStyle: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 50.h),

          // Loan icon placeholder
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200.h, // Adjust the height as per your requirement
                  width: 200.w, // Adjust the width as per your requirement
                  child: Lottie.asset('assets/animation/document.json'),
                ),
                SizedBox(height: 20),
                Text(
                  'Add your loan accounts on Vyapar\nand manage your Business Loans',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                ),
              ],
            ),
          ),

          Spacer(),

          // Add Loan Account Button
          Padding(
            padding: EdgeInsets.all(16.0.w),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddLoanAccountPage(),
                    ),
                  );
                },
                icon: Icon(Icons.add),
                label: Text('Add Loan Account'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent, // Button color
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  textStyle: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
