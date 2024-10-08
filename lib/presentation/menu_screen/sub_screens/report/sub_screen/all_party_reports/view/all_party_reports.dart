import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart'; // for date formatting
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllPartyReportsScreen extends StatefulWidget {
  @override
  _AllPartyReportsScreenState createState() => _AllPartyReportsScreenState();
}

class _AllPartyReportsScreenState extends State<AllPartyReportsScreen> {
  bool isChecked = false;
  bool isZeroBalanceChecked = false;
  String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String selectedParty = 'All Parties';
  String selectedSort = 'Name';

  List<String> partyTypes = ['All Parties', 'Receivables', 'Payables'];
  List<String> sortOptions = ['Name', 'Amount'];

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        selectedDate = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorconst.cBlue,
        title: const Text(
          "Party Report ",
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
              //  Fluttertoast.showToast(msg: "PDF Export Clicked");
            },
          ),
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colorconst.Green),
            onPressed: () {
              // Fluttertoast.showToast(msg: "Excel Export Clicked");
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          children: [
            Card(
              color: Colorconst.cGrey2,
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    Text(
                      "Date Filter",
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                    ),
                    SizedBox(
                      width: 80.w,
                    ),
                    GestureDetector(
                      onTap: isChecked
                          ? () {
                              _selectDate(context);
                            }
                          : null,
                      child: Row(
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                                color: Colorconst.cBlack, fontSize: 14.sp),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            selectedDate,
                            style: TextStyle(
                                color: Colorconst.cBlack, fontSize: 14.sp),
                          ),
                          //if (isChecked) Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Sort By",
                  style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                ),
                Text(
                  "Show",
                  style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
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
            Row(
              children: [
                Checkbox(
                  value: isZeroBalanceChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isZeroBalanceChecked = value ?? false;
                    });
                  },
                ),
                Text(
                  " Show 0 balance party",
                  style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Party Name",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colorconst.cGrey,
                        fontSize: 14.sp)),
                Text("Credit Limit",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colorconst.cGrey,
                        fontSize: 14.sp)),
                Text("Balance",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colorconst.cGrey,
                        fontSize: 14.sp)),
              ],
            ),
            // Example Party List
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Number of party items
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Party $index",
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 14.sp),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 14.sp),
                        ),
                        Text(
                          "\- ₹${(index + 1) * 500}",
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 14.sp),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
