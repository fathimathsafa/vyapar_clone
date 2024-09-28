import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class MyCompanies extends StatelessWidget {
  MyCompanies({super.key});

  // List of data for the companies
  final List<Map<String, dynamic>> companyData = [
    {
      'name': 'Abhi',
      'id': '1234567890',
      'statusColor': Colorconst.Green,
      'syncStatus': 'Sync Off',
    },
    {
      'name': 'Arun',
      'id': '1234567890',
      'statusColor': Colors.green,
      'syncStatus': 'Sync On',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cBluelight,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  companyData.length,
                  (index) => buildCompanyCard(context, companyData[index]),
                ), // Dynamically generate cards based on the company data list
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build individual company cards with specific data
  Widget buildCompanyCard(BuildContext context, Map<String, dynamic> company) {
    return Card(
      color: Colors.white, // Set card color to white
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      // elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side Icon (More Vert)

            // Right side Columns
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First row with text and status circle (conditionally displayed)
                  Row(
                    children: [
                      Text(
                        company['name'],
                        style: TextStyle(
                            fontSize: 16.sp, color: Colorconst.cBlack),
                      ),
                      SizedBox(width: 10.w),
                      // Show the status circle only if syncStatus is not 'Sync On'
                      if (company['syncStatus'] != 'Sync On') ...[
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                company['statusColor'], // Dynamic status color
                          ),
                        ),
                        SizedBox(width: 10.w), // Space between circle and icon
                      ],
                      // Use Spacer to push the icon to the end of the Row
                      const Spacer(), // This will take up the remaining space
                      GestureDetector(
                          onTap: () {
                            _showBottomSheet(context);
                          },
                          child: Icon(Icons.more_vert,
                              size: 25.sp, color: Colors.grey)),
                    ],
                  ),

                  SizedBox(height: 10.h),

                  // Second row with company ID (grey number)
                  Text(
                    company['id'],
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 10.h),

                  // Third row with color variation box and "Sync Status" button
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 9.w,
                              vertical:
                                  1.h), // Decreased padding for smaller size
                          backgroundColor: company['syncStatus'] == 'Sync Off'
                              ? Colorconst.cSecondaryGrey
                              : Colorconst
                                  .lightGreen, // Conditional button color
                        ),
                        child: Text(
                          company['syncStatus'],
                          style: TextStyle(
                            fontSize: 10.sp, // Smaller font size
                            color: company['syncStatus'] == 'Sync Off'
                                ? Colorconst.cGrey
                                : Colorconst.Green, // Conditional text color
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0), // Add padding to bottom sheet
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Adjusts the height based on content
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'More Options',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close bottom sheet
                    },
                    icon: Icon(
                      Icons.close,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Divider(), // Divider below heading
              SizedBox(height: 10.h),
              Text(
                'Rename Company',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15.h),
              const Divider(), // Divider between options
              SizedBox(height: 10.h),
              Text(
                'Delet Company',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15.h),
            ],
          ),
        );
      },
    );
  }
}
