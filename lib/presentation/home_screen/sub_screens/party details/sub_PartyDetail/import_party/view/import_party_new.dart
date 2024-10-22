import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import '../controller/controller.dart';

class ImportPartyPage extends StatelessWidget {
  ImportPartyPage({super.key});

  

  final _controller = Get.put(ImportPartyController());
  String _getFirstIndex(value) {
    if (value == null || value == '') {
      return "";
    } else {
      // int length = value.length;
      return value[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Import Parties from Contacts',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Obx(
           () {
            return _controller.showLoading.value?const Center(child: CircularProgressIndicator()): Column(
              children: [
                // Search Bar
                SizedBox(
                  height: 6.h,
                ),
                TextField(
                  controller: _controller.searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Contacts...',
                    helperStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.search, // Search icon
                      color: Colors.blue, // Icon color
                    ),
                  ),
                  onChanged: (value) {
                    // Implement search functionality if needed
                  },
                ),
                SizedBox(height: 20.h),
                // Display contacts
                Expanded(
                  child: Obx(() {
                    return _controller.contacts.length.toInt() == 0
                        ? Center(
                            child: Text(
                            "No Contact Found",
                            style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ))
                        : SizedBox(
                            width: double.infinity,
                            child: ListView.builder(
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount: _controller.contacts.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6.h),
                                  child: ListTile(
                                    tileColor: Colors.blue.shade300,
                                    leading: (_controller
                                                .contacts[index].photoOrThumbnail !=
                                            null)
                                        ? CircleAvatar(
                                            radius: 23.r,
                                            backgroundImage: MemoryImage(_controller
                                                .contacts[index].photoOrThumbnail!),
                                          )
                                        : CircleAvatar(
                                            radius: 23.r,
                                            child: Text(
                                              _getFirstIndex(_controller
                                                  .contacts[index].displayName
                                                  .toString()),
                                              style: GoogleFonts.inter(
                                                  color: Colors.black,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                    // leading: CircleAvatar(radius: 25.r,
                                    // child: _controller.contacts[index].photoOrThumbnail,
                                    // ),
                                    title: Text(
                                      _controller.contacts[index].displayName ??
                                          'No Name',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      _controller.contacts[index].phones
                                                  .isNotEmpty ==
                                              true
                                          ? _controller.contacts[index].phones.first
                                                  .number ??
                                              ''
                                          : 'No Phone Number',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                  }),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
