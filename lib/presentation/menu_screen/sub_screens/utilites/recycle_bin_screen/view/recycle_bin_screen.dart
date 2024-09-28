import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); // Initialize ScreenUtil

    return Scaffold(
      backgroundColor: Colorconst.cBluelight,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colorconst.cBlack), // Arrow button
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          'Recycle Bin',
          style: TextStyle(color: Colorconst.cBlack),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Padding for the body
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/recycle_bin_screen image.png', // Your image path here
                width: 150.w, // Responsive width
                height: 150.h,
                // Responsive height
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  Text(
                    'No Data Available', // First text
                    style: TextStyle(
                        fontSize: 16.sp, // Responsive font size
                        color: Colorconst.cBlack,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h), // Spacing between text
                  Text(
                    'No Data Available Availabe for Recycle Bin', // Second text
                    style: TextStyle(
                      fontSize: 14.sp, // Responsive font size
                      color: Colorconst.cGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
