import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class UserAddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add User',
          style: TextStyle(color: Colorconst.cBlack),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              hintText: "Enter Full Name *",
              labelText: "Enter Full Name *",
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextFormField(
              hintText: "Enter Phone Number or Email *",
              labelText: "Enter Phone Number or Email  *",
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'User will receive an invite on this number or email.',
              style: TextStyle(fontSize: 13.sp, color: Colorconst.cGrey),
            ),
            SizedBox(
              height: 20.h,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Choose User Role',
                labelStyle: TextStyle(fontSize: 14.sp, color: Colorconst.cGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                suffixText: '*',
                suffixStyle: TextStyle(color: Colorconst.cRed),
              ),
              items: <String>[
                'Secondary Admin',
                'Salesman',
                'Biller',
                "Biller and Salesman",
                "CA/Accountant",
                "Stock Keeper"
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colorconst.cBlack),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle dropdown change
              },
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200], // Light grey button
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                // Handle add user button press
              },
              child: Center(
                child: Text(
                  'Add User',
                  style: TextStyle(
                    color: Colorconst.cGrey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            //     TextFormField(
            //       decoration: InputDecoration(
            //         labelText: 'Enter Full Name',
            //         labelStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8.r),
            //         ),
            //         suffixText: '*',
            //         suffixStyle: TextStyle(color: Colors.red),
            //       ),
            //     ),
            //     SizedBox(height: 16.h),
            //     TextFormField(
            //       decoration: InputDecoration(
            //         labelText: 'Enter Phone Number or Email',
            //         labelStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8.r),
            //         ),
            //         suffixText: '*',
            //         suffixStyle: TextStyle(color: Colors.red),
            //       ),
            //     ),
            //     SizedBox(height: 8.h),

            //     SizedBox(height: 16.h),
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.all(16.w),
      //   child:
    );
  }
}
