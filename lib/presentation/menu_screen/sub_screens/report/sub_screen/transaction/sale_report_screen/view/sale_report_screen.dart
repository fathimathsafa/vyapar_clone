import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class SaleReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sale Report', style: TextStyle(fontSize: 16.sp)),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf, size: 20.sp),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.grid_on, size: 20.sp),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.w), // Use Screen Util for padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Text(
                      "This Month",
                      style: TextStyle(color: Colorconst.cBlack),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colorconst.cBlack,
                      ),
                    ),
                    VerticalDivider(
                      thickness: 2,
                      color: Colorconst.cGrey,
                    ),
                    SizedBox(width: 15.w),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(
                          '01/09/2024 TO 30/09/2024',
                          style: TextStyle(
                              fontSize: 12.sp, color: Colorconst.cBlack),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 12.h),

              // Filters Applied Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Filters Applied:',
                      style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                  OutlinedButton.icon(
                    icon: Icon(Icons.filter_alt, size: 16.sp),
                    label: Text('Filters',
                        style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                    onPressed: () {},
                    style:
                        OutlinedButton.styleFrom(padding: EdgeInsets.all(8.w)),
                  ),
                ],
              ),
              SizedBox(height: 4.h),

              // Filters Chips (now directly below "Filters Applied")
              Wrap(
                spacing: 8.0,
                children: [
                  FilterChip(
                    label: Text('Txns Type - Sale & Cr. Note',
                        style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                    onSelected: (_) {},
                  ),
                  FilterChip(
                    label: Text('Party - All Party',
                        style: TextStyle(fontSize: 12.sp)),
                    onSelected: (_) {},
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // Statistics Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('No of Txns', '3'),
                  _buildStatCard('Total Sale', '₹ 10.00'),
                  _buildStatCard('Balance Due', '₹ 0.00', isPositive: true),
                ],
              ),
              SizedBox(height: 12.h),

              // Transaction List
              _buildTransactionCard('Gokul', 'Amount', '₹ 10.00', 'Balance',
                  '₹ 0.00', 'SALE 1', '12 SEP, 24'),
              _buildTransactionCard('Gokul', 'Amount', '₹ 10,000.00', 'Balance',
                  '₹ 10,000.00', 'SALE 2', '19 SEP, 24'),
              _buildTransactionCard('Gokul', 'Amount', '₹ 10,000.00', 'Balance',
                  '₹ 10,000.00', 'CN 1', '19 SEP, 24'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, {bool isPositive = false}) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8.r), // Use Screen Util for border radius
      ),
      child: Container(
        width: 100.w, // Use Screen Util for width
        height: 100.h, // Use Screen Util for height
        padding: EdgeInsets.all(8.w), // Use Screen Util for padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),
            Text(
              value,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: isPositive ? Colors.green : Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionCard(String name, String label1, String value1,
      String label2, String value2, String txnType, String date) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.w), // Use Screen Util for padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Colors.black)),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label1 + ': ',
                            style: TextStyle(
                                fontSize: 12.sp, color: Colorconst.cBlack)),
                        Text(value1,
                            style: TextStyle(
                                fontSize: 12.sp, color: Colorconst.cBlack)),
                      ],
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label2 + ': ',
                            style: TextStyle(
                                fontSize: 12.sp, color: Colorconst.cBlack)),
                        Text(value2,
                            style: TextStyle(
                                fontSize: 12.sp, color: Colorconst.cBlack)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(txnType,
                    style:
                        TextStyle(fontSize: 12.sp, color: Colorconst.cBlack)),
                Text(date,
                    style:
                        TextStyle(fontSize: 12.sp, color: Colorconst.cBlack)),
                SizedBox(height: 10.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
