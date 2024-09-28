import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class UploadExcelScreen extends StatelessWidget {
  const UploadExcelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Excel File',
            style: TextStyle(color: Colorconst.cBlack)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colorconst.cBlack),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18.sp),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title for the steps
            Text(
              'Steps to Import',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colorconst.cBlack),
            ),
            SizedBox(height: 16.h),

            // Step 1
            buildStep(
              stepNumber: 'STEP 1',
              stepDescription:
                  'Create an Excel file with the following format.',
              additionalWidget: GestureDetector(
                onTap: () {
                  // Handle download sample action
                },
                child: Text(
                  'Download Sample',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              image: 'assets/images/excel_pic.png', // Replace with your image
            ),

            // Step 2
            SizedBox(height: 16.h),
            buildStep(
              stepNumber: 'STEP 2',
              stepDescription:
                  'Upload the file (xlsx or xls) by clicking on the Upload File button below.',
              additionalWidget: Icon(
                Icons.upload_rounded,
                size: 24.w,
                color: Colors.grey,
              ),
            ),

            // Step 3
            SizedBox(height: 16.h),
            buildStep(
              stepNumber: 'STEP 3',
              stepDescription:
                  'Verify the items from the file & complete the import.',
            ),

            Spacer(),

            // Upload button
            Center(
              child: ElevatedButton.icon(
                onPressed: () async {
                  // Open the file picker and allow the user to pick a file
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: [
                      'xls',
                      'xlsx'
                    ], // Only allow Excel files
                  );

                  if (result != null) {
                    // Get the file selected by the user
                    PlatformFile file = result.files.first;

                    // Do something with the file, like uploading it or reading it
                    print('File picked: ${file.name}');
                    // You can now upload the file or display it, etc.
                  } else {
                    // User canceled the picker
                    print('User canceled file picker.');
                  }
                },
                icon: Icon(
                  Icons.file_upload_outlined,
                  size: 24.w,
                  color: Colorconst.cwhite,
                ),
                label: Text(
                  'Upload File',
                  style: TextStyle(fontSize: 16.sp, color: Colorconst.cwhite),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorconst.cRed,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for each step
  Widget buildStep({
    required String stepNumber,
    required String stepDescription,
    Widget? additionalWidget,
    String? image,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stepNumber,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colorconst.cRed,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          stepDescription,
          style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
        ),
        if (additionalWidget != null) ...[
          SizedBox(height: 10.h),
          additionalWidget,
          SizedBox(height: 10.h),
        ],
        if (image != null) ...[
          SizedBox(height: 8.h),
          Image.asset(
            image, // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ],
      ],
    );
  }
}
