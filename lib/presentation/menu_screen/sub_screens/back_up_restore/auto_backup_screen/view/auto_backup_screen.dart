import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/back_up_restore/controller/back_up_controller.dart';

class AutoBackupSettings extends StatelessWidget {
  final AutoBackupController controller =
      Get.put(AutoBackupController()); // Inject the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Backup Settings',
            style: const TextStyle(color: Colorconst.cBlack)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colorconst.cBluelight,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Enable Auto Backup Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Enable auto backup',
                      style: TextStyle(
                          color: Colorconst.cBlack,
                          fontSize: 16.sp), // Text color and size
                    ),
                    SizedBox(width: 8.w), // Space between text and icon
                    Icon(Icons.info, color: Colorconst.cGrey), // Info icon
                  ],
                ),
                Obx(() => Switch(
                      value: controller.isAutoBackupEnabled.value,
                      onChanged: controller.toggleAutoBackup,
                      activeColor: Colors.blue,
                    )),
              ],
            ),
            SizedBox(height: 8.h), // Space after row
            Text(
              'Takes backup of your data automatically on your\npersonal Google Drive so that your data is safe',
              style: TextStyle(
                  color: Colorconst.cGrey, fontSize: 12.sp), // Two line text
            ),
            SizedBox(height: 20.h), // Space after row

            Divider(thickness: 1, color: Colors.grey), // Divider
            SizedBox(height: 10.h), // Space after divider

            // Manual Backup Reminder Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Manual Backup Reminder',
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 15.sp),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.info, color: Colorconst.cGrey),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: controller.decrementDays,
                    ),
                    Obx(() => Text(
                          '${controller.backupDays.value}', // Display number of days
                          style: TextStyle(
                              color: Colorconst.cBlack, fontSize: 15.sp),
                        )),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: controller.incrementDays,
                    ),
                    Text(
                      'Days',
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 16.h), // Space after text
            Text(
              '*Requires internet connection to take the backup on Google Drive.',
              style: TextStyle(color: Colorconst.cGrey, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
