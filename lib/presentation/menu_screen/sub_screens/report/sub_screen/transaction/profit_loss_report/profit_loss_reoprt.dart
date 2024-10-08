import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';

class ProfitAndLossReoprt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profit And Loss Report',
          style: TextStyle(fontSize: 16.sp), // Use sp for font sizes
        ),
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
          padding: EdgeInsets.all(8.w), // Use w for width and h for height
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date & Filter Row
              DateDropdownAndPicker(),
              Divider(),
              SizedBox(height: 12.h), // Use h for height

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('Gross Profit', 'RS 10.00', isPositive: true),
                  _buildStatCard('Net Profit', '₹ 10.00', isPositive: true),
                ],
              ),
              SizedBox(height: 12.h),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the box
                  borderRadius: BorderRadius.circular(8.w), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2.w, // How much the shadow spreads
                      blurRadius: 6.w, // Blurring of the shadow
                      offset: Offset(0, 3.h), // Changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header row for Particulars and Amount
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Particulars',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              'Amount',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Divider(),

                      // List of Particulars and Amounts
                      _buildParticularRow('Sale (+)', '₹ 10,010.00',
                          isPositive: true),
                      _buildParticularRow('Sale FA (+)', '₹ 0.00',
                          isPositive: true),
                      _buildParticularRow(
                          'Cr. Note/Sale Return (-)', '₹ 10,000.00',
                          isPositive: false),
                      _buildParticularRow('Purchase (-)', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Purchase FA (-)', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow(
                          'Dr. Note/Purchase Return (+)', '₹ 0.00',
                          isPositive: true),
                      _buildParticularRow('Payment Out Discount (+)', '₹ 0.00',
                          isPositive: true),

                      SizedBox(height: 10.h),
                      Divider(),
                      // Stocks Section
                      Text(
                        'Stocks',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('Opening Stock (-)', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Closing Stock (+)', '₹ 0.00',
                          isPositive: true),
                      _buildParticularRow('Opening FA Stock (-)', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Closing FA Stock (+)', '₹ 0.00',
                          isPositive: true),

                      // Direct Expense
                      SizedBox(height: 10.h),

                      Divider(),
                      Text(
                        'Direct Expenses (-)',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('Other Direct Expense', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Payment In Discount', '₹ 0.00',
                          isPositive: false),

                      // Tax Payable
                      SizedBox(height: 10.h),

                      Divider(),
                      Text(
                        'Tax Payable (-)',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('GST Payable', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('TCS Payable', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('TDS Payable', '₹ 0.00',
                          isPositive: false),

                      // Tax Receivable
                      SizedBox(height: 10.h),

                      Divider(),
                      Text(
                        'Tax Receivable (+)',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('GST Receivable', '₹ 0.00',
                          isPositive: true),
                      _buildParticularRow('TCS Receivable', '₹ 0.00',
                          isPositive: true),
                      _buildParticularRow('TDS Receivable', '₹ 0.00',
                          isPositive: true),
                      SizedBox(height: 10.h),

                      // Divider(),
                      Container(
                        height: 60.h,
                        decoration: BoxDecoration(color: Colors.green[100]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gross Profit ',
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              ' ₹ 10.00',
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                      ),
                      // Other income
                      SizedBox(height: 10.h),

                      // Divider(),
                      Text(
                        'Other Income (+)',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('Other Income', '₹ 0.00',
                          isPositive: true),
                      // Indirect expense
                      SizedBox(height: 10.h),

                      Divider(),
                      Text(
                        'InDirect Expenses (-)',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('Other Expense', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Loan interest Expense', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow(
                          'Loan Processing Fee Expense', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Charge on Loan Expense', '₹ 0.00',
                          isPositive: false),

                      Container(
                        height: 60.h,
                        decoration: BoxDecoration(color: Colors.green[100]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Net Profit ',
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              ' ₹ 10.00',
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String amount,
      {bool isPositive = false}) {
    return Container(
      width: 150.w, // Make the width responsive
      decoration: BoxDecoration(
        color: isPositive ? Colors.green[100] : Colors.red[100],
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w), // Make the padding responsive
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: isPositive ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              amount,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParticularRow(String title, String amount,
      {bool isPositive = true}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 8.h), // Make the padding responsive
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 12.sp,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
