import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/sales_return/sub_screens/credit_note/view/credit_note.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaleReturnScreen extends StatefulWidget {
  @override
  _SaleReturnScreenState createState() => _SaleReturnScreenState();
}

class _SaleReturnScreenState extends State<SaleReturnScreen> {
  String dropdownValue = 'This Month';
  DateTimeRange? selectedDateRange;

  // void _showDateRangePicker() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Container(
  //         padding: EdgeInsets.all(16.w), // Adjust using ScreenUtil
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             ListTile(
  //               title: Text('Today',
  //                   style:
  //                       TextStyle(color: Colorconst.cBlack, fontSize: 16.sp)),
  //               onTap: () {
  //                 setState(() {
  //                   selectedRange = 'Today';
  //                   startDate = DateTime.now();
  //                   endDate = DateTime.now();
  //                 });
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             // Other date range options...
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  Future<void> _selectDateRange(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDateRange: DateTimeRange(
        start: now.subtract(const Duration(days: 30)),
        end: now,
      ),
    );
    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String startDate = selectedDateRange != null
        ? DateFormat('dd/MM/yyyy').format(selectedDateRange!.start)
        : '01/09/2024';
    String endDate = selectedDateRange != null
        ? DateFormat('dd/MM/yyyy').format(selectedDateRange!.end)
        : '30/09/2024';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sale Return',
            style: TextStyle(
              color: Colorconst.cBlack,
            )),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down,
                        size: 19.sp,
                        color: Colors.black), // Dropdown icon color
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      "Today",
                      'This Month',
                      "This Quarter",
                      'Custom',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colorconst
                                    .cBlack)), // Dropdown items text color
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const VerticalDivider(
                    color: Colorconst.cGrey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today,
                        color: Colorconst.cBlue), // Calendar icon color
                    onPressed: () {
                      _selectDateRange(context);
                    },
                  ),
                  Text(
                    "$startDate to $endDate",
                    style: TextStyle(fontSize: 13.sp, color: Colorconst.cBlack),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Divider(
            //   color: Colors.black,
            //   indent: 15.w,
            //   endIndent: 15.w,
            // ),
            // Padding(
            //   padding: EdgeInsets.all(16.w),
            //   child: GestureDetector(
            //     onTap: _showDateRangePicker,
            //     child: IntrinsicHeight(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             selectedRange,
            //             style: TextStyle(
            //                 fontSize: 16.sp, fontWeight: FontWeight.bold),
            //           ),
            //           Icon(Icons.keyboard_arrow_down_outlined,
            //               color: Colors.blue, size: 24.sp),
            //           VerticalDivider(color: Colors.black),
            //           Row(
            //             children: [
            //               Icon(Icons.calendar_today,
            //                   color: Colors.blue, size: 18.sp),
            //               SizedBox(width: 3.w),
            //               Text(DateFormat('dd/MM/yyyy').format(startDate),
            //                   style: TextStyle(
            //                       color: Colorconst.cBlack, fontSize: 14.sp)),
            //               Text(" TO ", style: TextStyle(fontSize: 14.sp)),
            //               Text(DateFormat('dd/MM/yyyy').format(endDate),
            //                   style: TextStyle(
            //                       color: Colorconst.cBlack, fontSize: 14.sp)),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            //Divider(color: Colors.black, indent: 15.w, endIndent: 15.w),
            SizedBox(height: 10.h),
            // Placeholder for No Data Available
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryCard('No of Txns', '1'),
                _buildSummaryCard('Total Sale Return', '₹ 10000.00'),
                _buildSummaryCard('Balance Due', '₹ 0.00'),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Gokul',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colorconst.cBlack)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('SALE 1',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14.sp)),
                                  Text('12 SEP, 24',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14.sp)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Amount',
                                      style: TextStyle(
                                          color: Colorconst.cBlack,
                                          fontSize: 14.sp)),
                                  SizedBox(height: 4.h),
                                  Text('₹ 10000.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                          color: Colorconst.cBlack)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Balance',
                                      style: TextStyle(
                                          color: Colorconst.cBlack,
                                          fontSize: 14.sp)),
                                  SizedBox(height: 4.h),
                                  Text('₹ 0.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                          color: Colors.green)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16.h,
            left: MediaQuery.of(context).size.width / 2 - 50.w,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreditNoteScreen()));
              },
              icon: Icon(Icons.add, size: 24.sp),
              label: Text('Add Sale',
                  style: TextStyle(color: Colorconst.cBlack, fontSize: 16.sp)),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, {Color? color}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12.w),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: color ?? Colors.blue[50],
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 11.sp, color: Colors.grey[600])),
            SizedBox(height: 8.h),
            Text(value,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: value == '₹ 0.00' ? Colors.green : Colors.black)),
          ],
        ),
      ),
    );
  }
}
