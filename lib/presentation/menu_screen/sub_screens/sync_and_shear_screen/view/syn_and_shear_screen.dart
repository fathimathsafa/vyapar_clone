import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sync_and_shear_screen/sub_screen/add_user_screen/view/add_user_screen.dart';

class SyncShareScreen extends StatefulWidget {
  @override
  _SyncShareScreenState createState() => _SyncShareScreenState();
}

class _SyncShareScreenState extends State<SyncShareScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sync & Share',
          style: TextStyle(color: Colorconst.cBlack),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildPage(
                  image:
                      'assets/images/device_sync_screen.png', // Replace with your image path
                  title: 'Connect Multpile Devices',
                  description:
                      'Use your company in multiple devices and on the go by syncing it.',
                  //buttonText: 'Enable Sync',
                ),
                _buildPage(
                  image:
                      'assets/images/staff_syn_screen.png', // Replace with your image path
                  title: 'Give access to your staff',
                  description:
                      'Share your company with your staff in a secure manner by assigning roles.',
                  //buttonText: 'Enable Sync',
                ),
                // Add more pages if needed
              ],
            ),
          ),
          _buildPageIndicator(),
          SizedBox(
            height: 20.h,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: 30.h), // Adjust bottom padding as needed
                child: SizedBox(
                  width: 170.w, // Decrease button width
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Button color
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 12.h),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddUserScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sync,
                            size: 20.sp, color: Colorconst.cwhite), // Sync Icon
                        Text(
                          "Enable Sync",
                          style: TextStyle(
                              fontSize: 16.sp, color: Colorconst.cwhite),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "*You're logged in with 1234567890",
            style: TextStyle(fontSize: 14.sp, color: Colorconst.cGrey),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 200.h),
          SizedBox(height: 40.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colorconst.cBlack,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colorconst.cGrey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(_currentPage == 0),
        _buildDot(_currentPage == 1), // Add more dots if you have more pages
      ],
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      height: 8.h,
      width: 8.h,
      decoration: BoxDecoration(
        color: isActive ? Colorconst.cBlue : Colorconst.cGrey,
        shape: BoxShape.circle,
      ),
    );
  }
}
