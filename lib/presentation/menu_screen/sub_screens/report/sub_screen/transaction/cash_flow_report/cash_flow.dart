import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/transaction/cash_flow_report/controller.dart';

class CashFlowReportReport extends StatelessWidget {
  final CashFlowReportController controller =
      Get.put(CashFlowReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Cashflow Report',
          style: TextStyle(fontSize: 16.sp),
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
        bottom: TabBar(
          controller: controller.tabController,
          tabs: [
            Tab(text: 'Money In'),
            Tab(text: 'Money Out'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date & Filter Row
              IntrinsicHeight(
                child: Row(
                  children: [
                    Text(
                      "This Month",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_drop_down,
                          color: Colors.black, size: 20.sp),
                    ),
                    VerticalDivider(thickness: 2, color: Colors.grey),
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
              SizedBox(height: 12.h),

              // Filters Applied Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filters Applied:',
                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                  ),
                  OutlinedButton.icon(
                    icon: Icon(Icons.filter_alt, size: 16.sp),
                    label: Text(
                      'Filters',
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                    ),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(8.w),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),

              // Filter Chips
              Wrap(
                spacing: 8.0.w,
                children: [
                  FilterChip(
                    label: Text(
                      '0 Value Txn - Show',
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                    ),
                    onSelected: (_) {},
                  ),
                  FilterChip(
                    label: Text(
                      'Opening/Closing Cash - Consider',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    onSelected: (_) {},
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // Statistic Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('Closing Cash', '₹ 11.00', isPositive: true),
                  Text('=',
                      style: TextStyle(color: Colors.black, fontSize: 14.sp)),
                  _buildStatCard('Opening Cash', '₹ 0.00'),
                  Text('+',
                      style: TextStyle(color: Colors.black, fontSize: 14.sp)),
                  _buildStatCard('Money In', '₹ 11.00', isPositive: true),
                  Text('-',
                      style: TextStyle(color: Colors.black, fontSize: 14.sp)),
                  _buildStatCard('Money Out', '₹ 0.00'),
                ],
              ),
              SizedBox(height: 17.h),

              // Money In / Money Out Tabs Content
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2.r,
                      blurRadius: 5.r,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 200.h,
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          _buildTransactionList(isMoneyIn: true),
                          _buildTransactionList(isMoneyIn: false),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Total Money In/Out Row
                    Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          color: controller.isMoneyIn.value
                              ? Colors.green[50]
                              : Colors.red[50],
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.isMoneyIn.value
                                  ? 'Total Money In'
                                  : 'Total Money Out',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: controller.isMoneyIn.value
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                            Text(
                              controller.isMoneyIn.value
                                  ? '+ ₹ 11.00'
                                  : '- ₹ 0.00',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: controller.isMoneyIn.value
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
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

  // Statistic Card Widget
  Widget _buildStatCard(String title, String value, {bool isPositive = false}) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Container(
        width: 60.w,
        height: 70.h,
        padding: EdgeInsets.all(8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),
            Text(
              value,
              style: TextStyle(
                fontSize: 12.sp,
                color: isPositive ? Colors.green : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Transaction List Widget
  Widget _buildTransactionList({required bool isMoneyIn}) {
    return Column(
      children: [
        // Headers for the columns
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Name & Date',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: Colors.black)),
              Text('Txn Type',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: Colors.black)),
              Text(isMoneyIn ? 'Money In' : 'Money Out',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      color: Colors.black)),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        // Example transaction row
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('John Doe\n12/09/2024',
                  style: TextStyle(fontSize: 12.sp, color: Colors.black)),
              Text('Cash',
                  style: TextStyle(fontSize: 12.sp, color: Colors.black)),
              Text(isMoneyIn ? '+ ₹ 11.00' : '- ₹ 0.00',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: isMoneyIn ? Colors.green : Colors.red)),
            ],
          ),
        ),
      ],
    );
  }
}
