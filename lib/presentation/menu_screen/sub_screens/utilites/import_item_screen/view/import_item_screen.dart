import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/import_item_screen/sub_screens/item_library_screen/view/item_library_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/import_item_screen/sub_screens/micrsoft_excel_screen/view/microsoft_excel_screen.dart';

class ImportItemsScreen extends StatelessWidget {
  const ImportItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Import Items',
          style: TextStyle(color: Colorconst.cBlack),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Card(
            color: Colorconst.cwhite,
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: ListTile(
              leading: Image.asset(
                "assets/images/images__4_-removebg-preview.png",
                height: 30.h,
                width: 30.w,
                fit: BoxFit.fill,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item Library',
                    style: TextStyle(
                      color: Colorconst.cBlack,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
              subtitle: Column(
                children: [
                  Text(
                    'Add items from our database of 1 lakh+ items',
                    style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined,
                  color: Colorconst.cBlue),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemLibraryScreen()),
                );
              },
            ),
          ),
          Card(
            color: Colorconst.cwhite,
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: ListTile(
              leading: Image.asset(
                "assets/images/images__5_-removebg-preview.png",
                height: 30.h,
                width: 30.w,
                fit: BoxFit.fill,
              ),
              title: Column(
                children: [
                  Text(
                    'Microsoft Excel',
                    style: TextStyle(color: Colorconst.cBlack, fontSize: 18.sp),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
              subtitle: Column(
                children: [
                  Text(
                    'Upload your items from an Excel file',
                    style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined,
                  color: Colorconst.cBlue),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadExcelScreen()),
                );
              },
            ),
          ),
          Spacer(),
          Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/images__7_-removebg-preview.png",
                      height: 50.h,
                      width: 50.w,
                      fit: BoxFit.fill,
                    ),
                    VerticalDivider(
                      thickness: 1,
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      height: 30.h,
                      width: 150.h,
                      color: Colorconst.LightBrown,
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colorconst.Brown,
                            size: 14.sp,
                          ),
                          Text(
                            'Your data will be encrypted. No one\n can access without permission.',
                            style: TextStyle(
                                color: Colorconst.Brown, fontSize: 8.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  _showContactSupportDialog(context);
                },
                child: Text(
                  'Having trouble? Contact support',
                  style: TextStyle(
                    color: Colorconst.cBlue,
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void _showContactSupportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('WhatsApp'),
                onTap: () {
                  _launchURL(
                      'https://wa.me/your_number'); // Change this to a valid WhatsApp link
                },
              ),
              ListTile(
                title: const Text('Email'),
                onTap: () {
                  _launchURL('mailto:support@example.com');
                },
              ),
              ListTile(
                title: const Text('Message'),
                onTap: () {
                  _launchURL(
                      'sms:your_number'); // Replace with a valid phone number
                },
              ),
              ListTile(
                title: const Text('Call'),
                onTap: () {
                  _launchURL(
                      'tel:your_number'); // Replace with a valid phone number
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
