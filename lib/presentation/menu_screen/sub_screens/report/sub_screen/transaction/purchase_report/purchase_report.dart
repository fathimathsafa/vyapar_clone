import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';

class PurchaseReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design
    ScreenUtil.init(
      context,
      designSize: Size(375, 812), // Example design size; adjust as needed
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Purchase Report',
            style: TextStyle(fontSize: 16.sp)), // Responsive font size
        actions: [
          IconButton(
            icon:
                Icon(Icons.picture_as_pdf, size: 20.sp), // Responsive icon size
            onPressed: () {},
            tooltip: 'Download PDF',
          ),
          IconButton(
            icon: Icon(Icons.grid_on, size: 20.sp), // Responsive icon size
            onPressed: () {},
            tooltip: 'View as Grid',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6.w), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateDropdownAndPicker(),
              Divider(),
              SizedBox(height: 12.h), // Responsive height

              // Filters Applied Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Filters Applied:',
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black)), // Responsive font size
                  OutlinedButton.icon(
                    icon: Icon(
                      Icons.filter_alt,
                      size: 16.sp, // Responsive icon size
                    ),
                    label: Text('Filters',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black)), // Responsive font size
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(8.w)), // Responsive padding
                  ),
                ],
              ),
              SizedBox(height: 8.h), // Responsive height

              // Filters Chips
              Wrap(
                spacing: 8.w, // Responsive spacing
                children: [
                  FilterChip(
                    backgroundColor: Colors.white,
                    label: Text('Txns Type - Purchase & Dr. Note',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black)), // Responsive font size
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: 2.0.w), // Responsive padding
                    visualDensity: VisualDensity.compact,
                    onSelected: (_) {},
                  ),
                  FilterChip(
                    backgroundColor: Colors.white,
                    label: Text('Party - All Party',
                        style:
                            TextStyle(fontSize: 12.sp)), // Responsive font size
                    onSelected: (_) {},
                  ),
                ],
              ),
              SizedBox(height: 100.h), // Responsive height

              // Image and No Data Section
              Center(
                child: Container(
                  height: 100.h, // Responsive height
                  width: 100.w, // Responsive width
                  child: Image(
                      image: AssetImage('assets/images/purchase_order.jpg')),
                ),
              ),
              SizedBox(height: 50.h), // Responsive height
              Center(
                child: Column(
                  children: [
                    Text(
                      'No Data Available',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp), // Responsive font size
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'No data is available for this report. Please try\n again after making relevant changes.',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black), // Responsive font size
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
