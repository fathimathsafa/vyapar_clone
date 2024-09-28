import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class ImportPartyScreen extends StatefulWidget {
  const ImportPartyScreen({Key? key}) : super(key: key);

  @override
  _ImportPartyScreenState createState() => _ImportPartyScreenState();
}

class _ImportPartyScreenState extends State<ImportPartyScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Implement your action for the last screen if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); // Initialize ScreenUtil

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colorconst.cwhite,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
        title: Text(
          'Import Party',
          style: TextStyle(color: Colorconst.cwhite),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                _buildPage(
                    'Steps to Import',
                    'Verify the format of your excel sheet',
                    'assets/images/excel_pic.png', // Add your image path here
                    'DOWNLOAD SAMPLE',
                    '1'),
                _buildPage(
                    'Steps to Import',
                    'Select the fiels to import we support xls and xlsx',
                    'assets/images/images__7_-removebg-preview (1).png', // Add your image path here
                    '',
                    '2' // No last text
                    ),
                _buildPage(
                    'Steps to Import',
                    'continue to import fiels or correct items with errors',
                    'assets/images/images__6_-removebg-preview.png', // Add your image path here
                    '',
                    '3'
                    // No last text
                    ),
              ],
            ),
          ),
          // Dots indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: _currentPage == index ? 12.w : 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colorconst.cBlue
                      : Colorconst.cGrey,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),

          SizedBox(height: 29.h), // Spacing before the button
          MaterialButton(
            minWidth: double.infinity,
            height: 40.h,
            onPressed: () async {
              // Open file picker
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                allowedExtensions: ['xlsx', 'xls'], // Limit to Excel files
                type: FileType.custom,
              );

              if (result != null) {
                // File selected
                String? filePath = result.files.single.path;
                print(
                    "Selected file: $filePath"); // You can handle the file as needed
              } else {
                // User canceled the picker
                print("No file selected");
              }
            },
            color: Colorconst.cBlue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: Column(
              children: [
                Text(
                  'SELECT FILE',
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
                Text(
                  '(xlsx,xls)',
                  style: TextStyle(fontSize: 12.sp, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String subtitle, String imagePath,
      String lastText, String circleText) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title at the top
          Text(
            title,
            style: TextStyle(fontSize: 20.sp, color: Colorconst.cBlack),
          ),
          SizedBox(height: 20.h),
          // Subtitle and Circle Avatar in the next row
          Row(
            children: [
              CircleAvatar(
                radius: 19.r, // Responsive size
                backgroundColor: Colorconst.cBlue,
                child: Text(
                  circleText, // Change the text based on page
                  style: TextStyle(fontSize: 16.sp, color: Colorconst.cwhite),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  subtitle,
                  style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlue),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          // Image displayed below the subtitle
          Expanded(
            child: Center(
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          // Conditional last text button at the bottom
          if (lastText.isNotEmpty)
            Center(
              child: TextButton(
                onPressed: () {
                  // Show alert dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        content: Text(
                          "A sample Excel file has been saved at (file path).",
                          style: TextStyle(color: Colorconst.cBlack),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Close the alert dialog
                            },
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colorconst.Green),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  lastText,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colorconst.cBlue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
