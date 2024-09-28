import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class UnsentScreen extends StatelessWidget {
  const UnsentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Row(
                children: [
                  Checkbox(
                    value: false, // Manage this state accordingly
                    onChanged: (bool? value) {
                      // Handle Select All checkbox
                    },
                  ),
                  Text(
                    'Select All',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor:
                          Colors.white, // Set button background to white
                      side: BorderSide(color: Colorconst.cBlue), // Border color
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Handle resend selected action
                    },
                    child: Text(
                      'RESEND SELECTED',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colorconst.cBlue, // Button text color
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.grey, size: 24.w),
                    onPressed: () {
                      // Handle delete action
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Sent Tab
                  buildEmptyMessageView(),
                  // Unsent Tab
                  buildEmptyMessageView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Empty message screen UI
  Widget buildEmptyMessageView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.message,
          size: 80.sp,
          color: Colors.grey,
        ),
        SizedBox(height: 16.h),
        Text(
          'There are no messages as of yet.',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
