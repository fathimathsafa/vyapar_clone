import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the ScreenUtil package

class DayBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive sizing
    ScreenUtil.init(context, designSize: Size(360, 690));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Day Book',
          style: TextStyle(fontSize: 16.sp), // Use ScreenUtil for font size
        ),
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
          padding: EdgeInsets.all(8.w), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16.sp, // Responsive icon size
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8.w), // Responsive spacing
                        Text(
                          "Select Date:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp), // Responsive text size
                        ),
                        SizedBox(width: 8.w), // Responsive spacing
                        Text(
                          '01/09/2024 TO 30/09/2024',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black), // Responsive text size
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 12.h), // Responsive vertical spacing

              // Filters section commented out for future use
              // TODO: Add filter section if necessary

              SizedBox(
                  height: 100
                      .h), // Responsive spacing before image and no data section

              Center(
                child: Container(
                  height: 100.h, // Responsive container height
                  width: 100.w, // Responsive container width
                  child: Image(
                    image: AssetImage('assets/images/purchase_order.jpg'),
                    fit: BoxFit.contain, // Added to ensure image scales well
                  ),
                ),
              ),
              SizedBox(height: 50.h), // Responsive vertical spacing
              Center(
                child: Column(
                  children: [
                    Text(
                      'No Data Available',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.black // Responsive text size
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.h), // Responsive vertical spacing
                    Text(
                      'No data is available for this report. Please try\n again after making relevant changes.',
                      style: TextStyle(fontSize: 10.sp), // Responsive text size
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
