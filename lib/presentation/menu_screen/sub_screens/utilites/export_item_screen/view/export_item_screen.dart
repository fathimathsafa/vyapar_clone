import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class ExportItemScreen extends StatelessWidget {
  const ExportItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Export Item',
          style: TextStyle(color: Colorconst.cwhite),
        ),
      ),
      body: Column(
        children: [
          // The content and cards go in the SingleChildScrollView
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Example Card 1 containing item information
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Card(
                      color: Colorconst.cwhite,
                      elevation: 4.0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // First row: Item Name and Cake
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Item Name',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colorconst.cBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Cake',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colorconst.cBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            // Second row: Item Code and N/A
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Item Code',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                                Text(
                                  'N/A',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            SizedBox(height: 10.h),

                            // Third row: Sale Price and Purchase Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sale Price',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                                Text(
                                  'Purchase Price',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            // Fourth row: 50.00 and 0.00
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '₹50.00',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colorconst.cBlack),
                                ),
                                Text(
                                  '₹0.00',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colorconst.cBlack),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            // Fifth row: Current Stock Quantity and Minimum Quantity
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Current Stock \nQuantity',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                                Text(
                                  'Minimum Stock\n Quantity',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            // Fourth row: 50.00 and 0.00
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '-50.00',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colorconst.cBlack),
                                ),
                                Text(
                                  '0.00',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colorconst.cBlack),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            // Third row: Sale Price and Purchase Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tax Rate',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                                Text(
                                  'Tax Inclusive',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            // Third row: Sale Price and Purchase Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Item Location',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                                Text(
                                  'HSN',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Card(
                      color: Colorconst.cwhite,
                      elevation: 4.0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // First row: Item Name and Cake
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Item Name',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colorconst.cBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Cake',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colorconst.cBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            // Second row: Item Code and N/A
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Item Code',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                                Text(
                                  'N/A',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            SizedBox(height: 10.h),

                            // Third row: Sale Price and Purchase Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sale Price',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                                Text(
                                  'Purchase Price',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            // Fourth row: 50.00 and 0.00
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '₹50.00',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colorconst.cBlack),
                                ),
                                Text(
                                  '₹0.00',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colorconst.cBlack),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            // Fifth row: Current Stock Quantity and Minimum Quantity
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Current Stock \nQuantity',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                                Text(
                                  'Minimum Stock\n Quantity',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            // Fourth row: 50.00 and 0.00
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '-50.00',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colorconst.cBlack),
                                ),
                                Text(
                                  '0.00',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colorconst.cBlack),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            // Third row: Sale Price and Purchase Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tax Rate',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                                Text(
                                  'Tax Inclusive',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            // Third row: Sale Price and Purchase Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Item Location',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                                Text(
                                  'HSN',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colorconst.cGrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // The buttons fixed at the bottom of the screen
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    side: BorderSide(color: Colorconst.cGrey), // Border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    // Handle Export to SD action
                    _showExportDialog(context);
                  },
                  child: Text(
                    'EXPORT TO SD',
                    style: TextStyle(
                      color: Colorconst.cBlack, // Text color to match border
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colorconst.cBlue,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    _showExportDialogToEmail(context);
                  },
                  child: Text(
                    'EXPORT TO EMAIL',
                    style: TextStyle(
                      color: Colorconst.cwhite,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Function to show the export dialog
  void _showExportDialog(BuildContext context) {
    // Variable to hold the name of the file
    final TextEditingController fileNameController = TextEditingController(
      text: 'Exported_items_28_05_2024', // Pre-filled example text
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Name',
            style: TextStyle(
                fontSize: 18.sp, // Using ScreenUtil for adaptive font size
                color: Colorconst.cBlack, // Set the title color to black
                fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter the name of the file to be exported',
                style: TextStyle(
                  fontSize: 14.sp, // Adaptive font size for the description
                  color: Colorconst.cBlack, // Description text color is black
                ),
              ),
              SizedBox(height: 10.h), // Adaptive vertical spacing
              // TextFormField for entering file name
              TextFormField(
                controller: fileNameController, // Pre-filled text in the field
                style: TextStyle(
                  color:
                      Colors.black, // Text color inside TextFormField is black
                  fontSize: 14.sp, // Adaptive font size for text
                ),
                decoration: InputDecoration(),
              ),
            ],
          ),
          actions: [
            // "Cancel" and "OK" buttons
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 14.sp, // Adaptive font size for buttons
                  color: Colorconst.Green, // Button text color is black
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle the "OK" action, like exporting the file
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 14.sp, // Adaptive font size for buttons
                  color: Colorconst.Green, // Button text color is black
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showExportDialogToEmail(BuildContext context) {
    // Variable to hold the name of the file
    final TextEditingController fileNameController = TextEditingController(
      text: 'Exported_items_28_05_2024', // Pre-filled example text
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Name',
            style: TextStyle(
                fontSize: 18.sp, // Using ScreenUtil for adaptive font size
                color: Colorconst.cBlack, // Set the title color to black
                fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter the name of the file to be exported',
                style: TextStyle(
                  fontSize: 14.sp, // Adaptive font size for the description
                  color: Colorconst.cBlack, // Description text color is black
                ),
              ),
              SizedBox(height: 10.h), // Adaptive vertical spacing
              // TextFormField for entering file name
              TextFormField(
                controller: fileNameController, // Pre-filled text in the field
                style: TextStyle(
                  color:
                      Colors.black, // Text color inside TextFormField is black
                  fontSize: 14.sp, // Adaptive font size for text
                ),
                decoration: InputDecoration(),
              ),
            ],
          ),
          actions: [
            // "Cancel" and "OK" buttons
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 14.sp, // Adaptive font size for buttons
                  color: Colorconst.Green, // Button text color is black
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Get the entered file name
                String fileName = fileNameController.text;

                // Share the file name
                Share.share('File to be exported: $fileName');

                // Close the dialog after sharing
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 14.sp, // Adaptive font size for buttons
                  color: Colorconst.Green, // Button text color is black
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
