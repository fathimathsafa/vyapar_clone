import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('All Transactions', style: TextStyle(fontSize: 16.sp)),
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
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Text(
                      "This Month",
                      style: TextStyle(color: Colors.black, fontSize: 12.sp),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    ),
                    VerticalDivider(thickness: 2.w, color: Colors.grey),
                    SizedBox(width: 15.w),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(
                          '01/09/2024 TO 30/09/2024',
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    'All Transactions',
                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                  ),
                  SizedBox(height: 10.h),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Party Name All Parties',
                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                  ),
                  SizedBox(height: 10.h),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  ),
                ],
              ),
              Divider(),
              _buildTransactionCard('Gokul', 'Amount', '₹ 10.00', 'Balance',
                  '₹ 0.00', 'SALE: 1', '12 SEP, 24'),
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

  Widget _buildTransactionCard(String name, String label1, String value1,
      String label2, String value2, String txnType, String date) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.w),
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
                SizedBox(height: 5.h),
                Text(date,
                    style: TextStyle(fontSize: 12.sp, color: Colors.black)),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(txnType,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('$label1: ',
                    style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                Text(value1,
                    style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                SizedBox(height: 5.h),
                Text('$label2: ',
                    style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                Text(value2,
                    style: TextStyle(fontSize: 15.sp, color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
