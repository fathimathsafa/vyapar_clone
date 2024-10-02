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
  bool _isDataAvailable = false; // Simulate data availability

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
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text('Sale Return',
            style: TextStyle(
              color: Colorconst.cBlack,
            )),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            color: Colorconst.cwhite,
            child: IntrinsicHeight(
              child: Row(
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        size: 19.sp,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        "Today",
                        'This Month',
                        "This Quarter",
                        'Custom'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colorconst.cBlack,
                            ),
                          ),
                        );
                      }).toList(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colorconst.cBlack,
                      ),
                      dropdownColor: Colors.white,
                      isDense: true,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  const VerticalDivider(color: Colorconst.cGrey),
                  IconButton(
                    icon: const Icon(Icons.calendar_today,
                        color: Colorconst.cBlue),
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
          ),
          SizedBox(height: 10.h),

          // Main content
          _isDataAvailable
              ? Expanded(
                  child: Column(
                    children: [
                      // Sales Summary Section
                      Padding(
                        padding: EdgeInsets.only(left: 6.w, right: 6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSummaryCard('No of Txns', '1'),
                            _buildSummaryCard('Total Sale Return', '- ₹ 50.00'),
                            _buildSummaryCard('Balance Due', '₹ 50.00',
                                isRed: true),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),

                      // Transactions List Section
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colorconst.cwhite,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.r), // Responsive corner radius
                                ),
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.h), // Responsive margin
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      16.w), // Responsive padding
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Name',
                                            style: TextStyle(
                                                fontSize: 16
                                                    .sp, // Responsive text size
                                                fontWeight: FontWeight.bold,
                                                color: Colorconst.cBlack),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'CN 1',
                                                style: TextStyle(
                                                    color: Colorconst.cGrey,
                                                    fontSize: 12.sp),
                                              ),
                                              Text(
                                                '01 OCT, 24',
                                                style: TextStyle(
                                                    color: Colorconst.cGrey,
                                                    fontSize: 12.sp),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: 16.h), // Responsive spacing
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Amount',
                                                style: TextStyle(
                                                  color: Colorconst.cGrey,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              Text(
                                                '₹ 50.00',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colorconst.cGrey,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 80.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Balance',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              Text(
                                                '₹ 50.00',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.sp,
                                                  color: Colorconst.cGrey,
                                                ),
                                              ),
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
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/download-removebg-preview.png',
                        width: 100.w,
                        height: 100.h,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'No Data Available',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colorconst.cBlack),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'No data is available for this report. Please try again after making relevant changes.',
                        style:
                            TextStyle(fontSize: 15.sp, color: Colorconst.cGrey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreditNoteScreen()));
            },
            backgroundColor: Colorconst.cRed,
            icon: Icon(Icons.add, color: Colors.white),
            label: Text(
              'Add Sale Return',
              style: TextStyle(fontSize: 14.sp, color: Colorconst.cwhite),
            ),
            shape: StadiumBorder(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Widget to build each summary card
  Widget _buildSummaryCard(String title, String value, {bool isRed = false}) {
    return Card(
      color: Colorconst.cwhite,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r), // Responsive border radius
      ),
      child: Container(
        width: 105.w, // Responsive width
        height: 65.h, // Set a responsive height for the card
        padding: EdgeInsets.symmetric(
            vertical: 10.h, horizontal: 8.w), // Reduce padding
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Center the content vertically
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 11.sp, // Adjusted responsive text size
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 4.h), // Adjust spacing
            Text(
              value,
              style: TextStyle(
                fontSize: 14.sp, // Adjusted responsive text size
                fontWeight: FontWeight.bold,
                color: isRed ? Colorconst.cRed : Colorconst.cBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
