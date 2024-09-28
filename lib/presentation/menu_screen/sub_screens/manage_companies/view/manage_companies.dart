import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/manage_companies/sub_screens/my_companies/view/my_companies.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/manage_companies/sub_screens/shared_with_me_screen/view/shared_with_me_screen.dart';

class ManageCompanies extends StatefulWidget {
  @override
  _ManageCompaniesState createState() => _ManageCompaniesState();
}

class _ManageCompaniesState extends State<ManageCompanies>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _openFileManager() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      String filePath = result.files.single.path!;
      print('Selected file: $filePath');
      // Implement your backup restoration logic here
    } else {
      print('No file selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(null),
        title: const Text(
          'Manage Companies',
          style: TextStyle(color: Colorconst.cBlack),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Transform(
                transform: Matrix4.diagonal3Values(-1, 1, 1),
                alignment: Alignment.center,
                child: Icon(
                  Icons.replay,
                  size: 23.sp,
                  color: Colorconst.cGrey,
                ),
              )),
          IconButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              icon: Icon(
                Icons.more_vert,
                size: 23.sp,
                color: Colorconst.cGrey,
              ))
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colorconst.cRed, // Color for the selected tab's text
          unselectedLabelColor:
              Colors.grey, // Color for the unselected tab's text
          labelStyle: TextStyle(
            fontSize: 16.sp, // Text size for the selected tab
            fontWeight: FontWeight.normal, // Text weight for the selected tab
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14.sp, // Text size for the unselected tab
            fontWeight: FontWeight.normal, // Text weight for the unselected tab
          ),
          indicatorColor: Colorconst.cRed,
          tabs: [
            const Tab(text: 'My Companies'),
            const Tab(text: 'Shared With Me'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MyCompanies(),
                const SharedWithMeScreen(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: _openFileManager, // Call file picker,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        color: Colors.red, width: 2), // Red border color
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 12.h), // Increase button size
                    shape: const StadiumBorder(),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Adjust size to content
                    children: [
                      const Icon(
                        Icons.replay, // Sync icon
                        color: Colorconst.cRed, // Icon color
                      ),
                      SizedBox(width: 8.w), // Space between icon and text
                      Text(
                        'Restore Backup', // Button text
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colorconst.cRed, // Text color
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showAddCompanyBottomSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colorconst.cRed, // Red background color
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 12.h), // Increase button size
                    shape: const StadiumBorder(),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Adjust size to content
                    children: [
                      const Icon(
                        Icons.add_circle_outline_rounded, // Add icon
                        color: Colors
                            .white, // Icon color (white for contrast with red background)
                      ),
                      SizedBox(width: 8.w), // Space between icon and text
                      Text(
                        'Add Company', // Button text
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colorconst
                              .cwhite, // Text color (white for contrast with red background)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0), // Add padding to bottom sheet
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Adjusts the height based on content
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'More Options',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close bottom sheet
                    },
                    icon: Icon(
                      Icons.close,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Divider(), // Divider below heading
              SizedBox(height: 10.h),
              Text(
                'About Vyabar',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15.h),
              const Divider(), // Divider between options
              SizedBox(height: 10.h),
              Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15.h),
            ],
          ),
        );
      },
    );
  }

  void _showAddCompanyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delete Company',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colorconst.cBlack,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity, // Fit the container to screen width
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colorconst.cPink, // Light pink color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.red), // Info icon
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'You have exceeded the limit for the number of companies.',
                        style:
                            TextStyle(color: Colorconst.cRed, fontSize: 10.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h), // Space between messages
              Text(
                'Please delete at least 1 Unique company from the list below to\ncontinue using multiple companies',
                style: TextStyle(fontSize: 11.sp, color: Colorconst.cBlack),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Container(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ahbi',
                      style: TextStyle(color: Colorconst.cBlack),
                    ),
                    Container(
                      height: 20.h,
                      width: 70.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colorconst.cCream,
                      ),
                      child: Center(
                        child: Text(
                          "Current Company",
                          style: TextStyle(
                              color: Colorconst.cOrange, fontSize: 9.sp),
                        ),
                      ),
                    ),
                    Checkbox(
                      value:
                          false, // Change this based on your state management
                      onChanged: (value) {
                        // Handle checkbox change
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
              Container(
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Arun',
                      style: TextStyle(color: Colorconst.cBlack),
                    ),
                    Checkbox(
                      value:
                          false, // Change this based on your state management
                      onChanged: (value) {
                        // Handle checkbox change
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(height: 10.h), // Space before buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your delete action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colorconst.cSecondaryGrey,
                      shape: const StadiumBorder(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                    ),
                    child: Text(
                      '    Delete    ',
                      style:
                          TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context); // Close the bottom sheet or perform another action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colorconst.cRed, // Change to your preferred color
                      shape: const StadiumBorder(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                    ),
                    child: Text(
                      'Backup & Delete',
                      style:
                          TextStyle(color: Colorconst.cwhite, fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
