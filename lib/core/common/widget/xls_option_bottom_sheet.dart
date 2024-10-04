import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class XlsOptionsBottomSheet extends StatelessWidget {
  const XlsOptionsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header Row: "Excel Options" and Close Icon
        Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Excel Options',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colorconst.cBlack),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        Divider(),
        _excelOptionItem(
          context,
          icon: Icons.document_scanner_outlined,
          text: 'Open Excel',
          onTap: () {
            _showReportNameDialog(context);
          },
        ),
        Divider(),
        _excelOptionItem(
          context,
          icon: Icons.forward,
          text: 'Share Excel',
          onTap: () {
            // Implement sharing functionality here
          },
        ),
        Divider(),
        _excelOptionItem(
          context,
          icon: Icons.print_outlined,
          text: 'Export Excel',
          onTap: () {
            // Implement export functionality here
          },
        ),
      ],
    );
  }

  void _showReportNameDialog(BuildContext context) {
    final TextEditingController _textEditingController = TextEditingController(
        text: "/path/to/demo.xlsx"); // Changed the file extension to .xlsx

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' Name',
                style: TextStyle(color: Colorconst.cBlack),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ' Enter Name for the report',
                style: TextStyle(color: Colorconst.cBlack),
              ),
              TextFormField(
                style: TextStyle(color: Colorconst.cBlack),
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: "/path/to/demo.xlsx", // Updated hint text
                  hintStyle: TextStyle(color: Colors.black),
                  isDense: true, // To make it more compact
                  contentPadding:
                      EdgeInsets.only(bottom: 5.0), // Reduce padding
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black), // Single bottom line
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            // Cancel Button
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colorconst.cBlue),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            // OK Button
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colorconst.cBlue),
              ),
              onPressed: () {
                // Handle the OK action, like saving the name or file path
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  // Widget for each option (icon and text)
  Widget _excelOptionItem(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 8.0), // Added padding for better spacing
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 25.sp, color: Colorconst.cBlack),
            SizedBox(width: 8.w), // Space between icon and text
            Text(
              text,
              style: TextStyle(color: Colorconst.cBlack, fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
