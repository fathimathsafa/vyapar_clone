import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class AutoBackupSettings extends StatefulWidget {
  @override
  _AutoBackupSettingsState createState() => _AutoBackupSettingsState();
}

class _AutoBackupSettingsState extends State<AutoBackupSettings> {
  bool _isAutoBackupEnabled = false; // State for auto backup toggle
  int _backupDays = 3; // Default backup reminder days

  void _toggleAutoBackup(bool? value) {
    setState(() {
      _isAutoBackupEnabled = value ?? false; // Toggle the state
    });
  }

  void _incrementDays() {
    setState(() {
      _backupDays++; // Increment the backup days
    });
  }

  void _decrementDays() {
    if (_backupDays > 1) {
      setState(() {
        _backupDays--; // Decrement the backup days
      });
    }
  }

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
        ), // Leading icon
        backgroundColor: Colorconst.cBluelight, // Set app bar background color
        // Set icon color in app bar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Padding for the body
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
                Switch(
                  value: _isAutoBackupEnabled,
                  onChanged: _toggleAutoBackup,
                  activeColor: Colors.blue, // Change color when enabled
                ),
              ],
            ),
            SizedBox(height: 8.h), // Space after row
            Text(
              'Takes backup of your data automatically on youe\npersonal google drive so that your data is safe',
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
                      onPressed: _decrementDays,
                    ),
                    Text(
                      '$_backupDays', // Display number of days
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 15.sp),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: _incrementDays,
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
