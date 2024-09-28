import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class RequestBillBookScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Import from My Bill Book",
          style: const TextStyle(color: Colorconst.cBlack),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full Name TextFormField with increased size
            TextFormField(
              controller: fullNameController,
              style: TextStyle(
                color: Colors.black, // Set text color to black
                fontSize: 18.sp, // Increase text size
              ),
              decoration: InputDecoration(
                labelText: 'Full Name *',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'Enter your full name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                ), // Adjust hint text size
                errorText: fullNameController.text.isEmpty && false
                    ? 'Please enter your full name'
                    : null,
                border: OutlineInputBorder(), // Add border
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey), // Border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue), // Focused border color
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 12.w,
                ), // Increase height and horizontal padding
              ),
            ),
            SizedBox(height: 16.h), // Spacer between fields

            // Phone Number TextFormField with increased size
            TextFormField(
              controller: phoneNumberController,
              style: TextStyle(
                color: Colors.black, // Set text color to black
                fontSize: 18.sp, // Increase text size
              ),
              decoration: InputDecoration(
                labelText: 'Phone Number *',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'Enter your phone number',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                ), // Adjust hint text size
                errorText: phoneNumberController.text.isEmpty && false
                    ? 'Please enter your phone number'
                    : null,
                border: OutlineInputBorder(), // Add border
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey), // Border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue), // Focused border color
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 12.w,
                ), // Increase height and horizontal padding
              ),
              keyboardType: TextInputType.phone,
            ),
            Spacer(), // Push the button to the bottom of the screen

            // Submit Button
            SizedBox(
              width: double.infinity, // Fit the button to the screen width
              child: ElevatedButton(
                onPressed: () {
                  if (fullNameController.text.isEmpty ||
                      phoneNumberController.text.isEmpty) {
                    // Check if fields are empty and show error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all fields')),
                    );
                  } else {
                    // Handle submit logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Request Submitted!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: (fullNameController.text.isEmpty ||
                          phoneNumberController.text.isEmpty)
                      ? Colors.grey // Grey color if any field is empty
                      : Colors.red, // Red color if all fields are filled
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h), // Button padding
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18.sp), // Responsive text size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
