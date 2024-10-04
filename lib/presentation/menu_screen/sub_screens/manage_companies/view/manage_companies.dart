import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/manage_companies/controller/manage_compinies_controller.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/manage_companies/sub_screens/my_companies/view/my_companies.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/manage_companies/sub_screens/shared_with_me_screen/view/shared_with_me_screen.dart';

class ManageCompanies extends StatelessWidget {
  final ManageCompaniesController controller =
      Get.put(ManageCompaniesController());

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
            ),
          ),
          IconButton(
            onPressed: () => controller.showBottomSheet(context),
            icon: Icon(
              Icons.more_vert,
              size: 23.sp,
              color: Colorconst.cGrey,
            ),
          )
        ],
        bottom: TabBar(
          controller: controller.tabController,
          labelColor: Colorconst.cRed,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(fontSize: 16.sp),
          unselectedLabelStyle: TextStyle(fontSize: 14.sp),
          indicatorColor: Colorconst.cRed,
          tabs: const [
            Tab(text: 'My Companies'),
            Tab(text: 'Shared With Me'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
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
                  onPressed: controller.openFileManager,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red, width: 2),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                    shape: const StadiumBorder(),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.replay, color: Colorconst.cRed),
                      SizedBox(width: 8.w),
                      Text(
                        'Restore Backup',
                        style:
                            TextStyle(fontSize: 13.sp, color: Colorconst.cRed),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () =>
                      controller.showAddCompanyBottomSheet(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colorconst.cRed,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                    shape: const StadiumBorder(),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add_circle_outline_rounded,
                          color: Colors.white),
                      SizedBox(width: 8.w),
                      Text(
                        'Add Company',
                        style: TextStyle(
                            fontSize: 13.sp, color: Colorconst.cwhite),
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
}
