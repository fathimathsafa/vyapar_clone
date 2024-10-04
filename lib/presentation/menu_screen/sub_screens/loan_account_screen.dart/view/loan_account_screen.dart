import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/loan_account_screen.dart/sub_screens/add_loan_account_screen/view/add_loan_account_screen.dart';

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
            // Handle back button press
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Banner at the top
          Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue[50], // Background color for the banner
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Wrap the text Column in a Container with a specific width
                Container(
                  width: 200, // Set the desired width here
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
                      SizedBox(height: 4),
                      Text(
                        'Business Loans up to 30 lakhs!',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Now avail loans with completely digital process, no\ncollateral and fast disbursal',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '1L+ loan applications',
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                // Adjusted button container to maintain alignment
                Column(
                  children: [
                    SizedBox(height: 50), // Adjust the height as needed
                    ElevatedButton(
                      onPressed: () {
                        // Handle Explore now button press
                      },
                      child: Text('Explore now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blueAccent, // Button background color
                        textStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 50),

          // Loan icon placeholder
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200, // Adjust the height as per your requirement
                  width: 200, // Adjust the width as per your requirement
                  child: Lottie.asset('assets/loan.json'),
                ),
                SizedBox(height: 20),
                Text(
                  'Add your loan accounts on Vyapar\nand manage your Business Loans',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),

          Spacer(),

          // Add Loan Account Button
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                  padding: EdgeInsets.symmetric(vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
