import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for date formatting
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PartyReportByItemsScreen extends StatefulWidget {
  @override
  _PartyReportByItemsScreenState createState() =>
      _PartyReportByItemsScreenState();
}

class _PartyReportByItemsScreenState extends State<PartyReportByItemsScreen> {
  String dropdownValue = 'This Month';
  DateTimeRange? selectedDateRange;
  List<String> partyTypes = [
    'All Categories',
    'Uncategorized',
  ];
  List<String> sortOptions = [
    'Party name',
    'Sale quantity',
    'Purchase quantity'
  ];
  String selectedParty = 'All Categories';
  String selectedSort = 'Party name';

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
    // Formatting date range
    String startDate = selectedDateRange != null
        ? DateFormat('dd/MM/yyyy').format(selectedDateRange!.start)
        : '01/09/2024';
    String endDate = selectedDateRange != null
        ? DateFormat('dd/MM/yyyy').format(selectedDateRange!.end)
        : '30/09/2024';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        title: const Text(
          "All Party Reports",
          style: TextStyle(
            color: Colorconst.cwhite,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colorconst.cwhite,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.picture_as_pdf,
              color: Colorconst.cRed,
            ),
            onPressed: () {
              // PDF Export Clicked
            },
          ),
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colorconst.Green),
            onPressed: () {
              // Excel Export Clicked
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row with dropdown and "This Month" text
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: TextStyle(color: Colorconst.cBlue, fontSize: 14.sp),
                ),
                Text(
                  "Sort By",
                  style: TextStyle(color: Colorconst.cBlue, fontSize: 14.sp),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: selectedParty,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30.sp,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedParty = newValue!;
                    });
                  },
                  items:
                      partyTypes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colorconst.cBlack, fontSize: 14.sp),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: selectedSort,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 30.sp,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSort = newValue!;
                    });
                  },
                  items:
                      sortOptions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color: Colorconst.cBlack, fontSize: 14.sp),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const Divider(),
            Text(
              "Enter Item Name",
              style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'All Items', // Placeholder text
                border: UnderlineInputBorder(), // Single line underline
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Line color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0), // Line color and thickness when focused
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Party Name",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colorconst.cGrey,
                        fontSize: 14.sp)),
                SizedBox(
                  width: 10.w,
                ),
                Text("Sale qty",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colorconst.cGrey,
                        fontSize: 14.sp)),
                Text("Purchase qty",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colorconst.cGrey,
                        fontSize: 14.sp)),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Number of party items
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Party $index",
                              style: TextStyle(
                                  color: Colorconst.cBlack, fontSize: 14.sp),
                            ),
                            Text(
                              "2.0",
                              style: TextStyle(
                                  color: Colorconst.cBlack, fontSize: 14.sp),
                            ),
                            Text(
                              "\ 0.0",
                              style: TextStyle(
                                  color: Colorconst.cBlack, fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      // Adding Divider after each item except the last one
                      if (index < 5)
                        SizedBox(
                          height: 10.h,
                        ),
                      const Divider(
                        color: Colors
                            .grey, // You can customize the color of the divider
                        thickness:
                            1.0, // Customize the thickness of the divider
                      ),
                    ],
                  );
                },
              ),
            ),

            const Spacer(), // Pushes the total row to the bottom of the screen

            // Bottom row for total display
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colorconst.cBlack),
                ),
                Text(
                  "2.0", // Example total amount
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colorconst.cBlack),
                ),
                Text(
                  "0.0", // Example balance
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colorconst.cBlack),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
