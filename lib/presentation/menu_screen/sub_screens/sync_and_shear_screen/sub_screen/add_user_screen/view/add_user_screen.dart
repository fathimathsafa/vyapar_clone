import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sync_and_shear_screen/sub_screen/user_add_screen/view/user_add_screen.dart';

class AddUserScreen extends StatelessWidget {
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
          'Sync & Share',
          style: TextStyle(
              color: Colorconst.cBlack,
              fontSize: 18.sp), // Responsive font size
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // Handle info icon press
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options button
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Responsive padding
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.r), // Responsive border radius
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w), // Responsive padding
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Logged in with',
                          style: TextStyle(
                              color: Colorconst.cGrey,
                              fontSize: 14.sp), // Responsive text
                        ),
                        SizedBox(height: 4.h), // Responsive spacing
                        Text(
                          '1234567890',
                          style: TextStyle(
                              fontSize: 18.sp, // Responsive font size
                              fontWeight: FontWeight.bold,
                              color: Colorconst.cBlack),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.refresh,
                      color: Colorconst.Green,
                      size: 24.sp, // Responsive icon size
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h), // Responsive spacing
            Card(
              color: Colorconst.cRed,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.r), // Responsive border radius
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w), // Responsive padding
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Next Step : Add Users',
                            style: TextStyle(
                              color: Colorconst.cwhite,
                              fontSize: 16.sp, // Responsive font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h), // Responsive spacing
                          Text(
                            'Now, add users and assign them relevant roles to manage Business.',
                            style: TextStyle(
                              color: Colorconst.cwhite,
                              fontSize: 14.sp, // Responsive font size
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w), // Responsive spacing
                    Icon(
                      Icons.person_add,
                      color: Colors.white,
                      size: 40.sp, // Responsive icon size
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserAddScreen()));
            },
            backgroundColor: Colorconst.cRed,
            icon: Icon(Icons.add, color: Colors.white),
            label: Text(
              'Add User',
              style: TextStyle(fontSize: 14.sp, color: Colorconst.cwhite),
            ),
            shape: StadiumBorder(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
