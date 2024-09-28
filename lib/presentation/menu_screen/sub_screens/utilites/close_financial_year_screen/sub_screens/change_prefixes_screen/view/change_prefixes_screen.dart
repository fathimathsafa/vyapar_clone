import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class PrefixScreen extends StatefulWidget {
  @override
  _PrefixScreenState createState() => _PrefixScreenState();
}

class _PrefixScreenState extends State<PrefixScreen> {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Vyapar', style: TextStyle(color: Colorconst.cwhite)),
        backgroundColor: Colorconst.cBlue, // Adjusted color for AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colorconst.cwhite),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Using ScreenUtil for padding
        child: Column(
          children: [
            // Text form fields for different prefixes
            buildTextField('Invoice Prefix*'),
            SizedBox(height: 16.h), // Responsive spacing
            buildTextField('Estimate Prefix'),
            SizedBox(height: 16.h),
            buildTextField('Delivery Challan Prefix'),
            SizedBox(height: 16.h),
            buildTextField('Payment In Prefix'),
            SizedBox(height: 16.h),
            buildTextField('Sale Order Prefix'),
            SizedBox(height: 16.h),
            buildTextField('Purchase Order Prefix'),
            SizedBox(height: 16.h),
            buildTextField('Credit Note Prefix'),
            Spacer(), // Pushes the button to the bottom
            // Done button
            ElevatedButton(
              onPressed: () {
                // Action for done button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color(0xFF0277BD), // Button color to match the image
                padding:
                    EdgeInsets.symmetric(vertical: 16.h), // Responsive padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // No rounded corners
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'DONE',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colorconst.cwhite), // Responsive font size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build a text field with black text color
  Widget buildTextField(String label) {
    return TextFormField(
      style:
          TextStyle(color: Colors.black), // Set the entered text color to black
      decoration: InputDecoration(
        labelText: label,
        labelStyle:
            TextStyle(color: Colors.grey, fontSize: 14.sp), // Label styling
        border: UnderlineInputBorder(),
      ),
    );
  }
}
