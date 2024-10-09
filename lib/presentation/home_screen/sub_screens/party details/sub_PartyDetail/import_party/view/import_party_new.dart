import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';


import '../controller/controller.dart';

class ImportPartyPage extends StatelessWidget {
   ImportPartyPage({super.key});




  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Please allow us to collect your\ncontacts to enhance your experience\non Vyapar.',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.start,
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue background
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the first dialog
                _showPermissionDialog(context); // Show the second dialog
              },
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white), // White text
              ),
            ),
          ],
        );
      },
    );
  }

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min, // Make the dialog content compact
            children: [
              Icon(Icons.contacts, size: 50), // Icon in the center
              SizedBox(height: 10), // Space between icon and text
              Text(
                'Allow Vyapar to access your contacts?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20), // Space before buttons
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Space buttons evenly
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Blue background
                    ),
                    onPressed: () async {
                      // Handle allow action
                      Navigator.of(context).pop(); // Close the second dialog
                      await _requestContactsPermission(context); // Request permission
                    },
                    child: Text(
                      "Allow",
                      style: TextStyle(color: Colors.white), // White text
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey, // Grey background
                    ),
                    onPressed: () {
                      // Handle don't allow action here
                      Navigator.of(context).pop(); // Close the second dialog
                    },
                    child: Text(
                      "Don't Allow",
                      style: TextStyle(color: Colors.white), // White text
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

  Future<void> _requestContactsPermission(context) async {
    var status =
        await Permission.contacts.request(); // Request contact permission
    if (status.isGranted) {
      // If permission is granted, fetch the contacts
      // _fetchContacts();
    } else {
      // Handle the case when permission is denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          "Contacts permission denied.",
          style: TextStyle(color: Colors.black),
        )),
      );
    }
  }
 
 final _controller = Get.put(ImportPartyController());
String _getFirstIndex(value){
   if(value == null || value ==''){
    
     return "";
     
     }else{
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
        padding:  EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          children: [
            // Search Bar
            SizedBox(height: 6.h,),
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
              child:
               Obx(
               () {
                  return
                 _controller.contacts.length.toInt()==0?Center(child: Text("No Contact Found",style: GoogleFonts.inter(fontSize: 18.sp,color: Colors.black,fontWeight: FontWeight.w700),)):  SizedBox(
                    width: double.infinity,
                     child: ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: _controller.contacts.length,
                      itemBuilder: (context, index) {
                        
                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: 6.h),
                          child: ListTile(
                            tileColor: Colors.blue.shade300,
                            leading: (_controller.contacts[index].photoOrThumbnail != null)
                      ? CircleAvatar(
                        radius: 23.r,
                          backgroundImage: MemoryImage(_controller.contacts[index].photoOrThumbnail!),
                        )
                      : CircleAvatar(
                        radius: 23.r,
                          child: Text(  _getFirstIndex(_controller.contacts[index].displayName.toString()),style: GoogleFonts.inter(color: Colors.black,fontSize: 17.sp,fontWeight: FontWeight.w700),),
                        ),
                            // leading: CircleAvatar(radius: 25.r,
                            // child: _controller.contacts[index].photoOrThumbnail,
                            // ),
                            title: Text(
                              _controller.contacts[index].displayName ?? 'No Name',
                           
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              _controller.contacts[index].phones.isNotEmpty == true
                                  ? _controller.contacts[index].phones.first.number ?? ''
                                  : 'No Phone Number',
                            
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                                       ),
                   );
                }
              ),
            ),
          ],
        ),
      ),
    );


  }


}