import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalePurchaseByPartyScreen extends StatefulWidget {
  @override
  State<SalePurchaseByPartyScreen> createState() =>
      _SalePurchaseByPartyScreenState();
}

class _SalePurchaseByPartyScreenState extends State<SalePurchaseByPartyScreen> {
  String dropdownValue = 'This Month';

  DateTimeRange? selectedDateRange;

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
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Colorconst.cBlack, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colorconst.cBlack, // Body text color
            ),
            textTheme: TextTheme(
              bodyMedium:
                  TextStyle(color: Colorconst.cBlack), // Dates text color
            ),
            dialogBackgroundColor: Colors.white, // Picker background color
          ),
          child: child!,
        );
      },
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
      appBar: AppBar(
        title: const Text(
          "Sale/Purchase By Party",
          style: TextStyle(
            color: Colorconst.cBlack,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colorconst.cBlack,
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue.shade100,
                Colors.lightBlue.shade50,
                Colors.lightBlue.shade50,
                Colors.lightBlue.shade50,
                Colors.lightBlue.shade50,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Container(
                color: Colorconst.cwhite,
                child: IntrinsicHeight(
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
                      GestureDetector(
                        onTap: () {
                          _selectDateRange(context);
                        },
                        child: Text(
                          "$startDate to $endDate",
                          style: TextStyle(
                              fontSize: 13.sp, color: Colorconst.cBlack),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SizedBox(width: 15.h),
                  Container(
                    height: 50.h,
                    width: 140.h,
                    decoration: BoxDecoration(
                        color: Colorconst.cwhite,
                        borderRadius: BorderRadius.circular(10.w)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total Sale Amount',
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 13.sp),
                        ),
                        Text(
                          '\₹5000',
                          style: TextStyle(
                              color: Colorconst.cBlack, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.h),
                  Container(
                    height: 50.h,
                    width: 140.h,
                    decoration: BoxDecoration(
                        color: Colorconst.cwhite,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Total  Purchase Amount',
                          style: TextStyle(
                              color: Colorconst.cGrey, fontSize: 13.sp),
                        ),
                        Text(
                          '\₹5000',
                          style: TextStyle(
                              color: Colorconst.cBlack, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Table for transactions
              _buildTransactionsTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionsTable() {
    return Card(
      color: Colorconst.cwhite,
      margin: EdgeInsets.all(10.w),
      child: Column(
        children: [
          ListTile(
            leading: Text(
              'Party name',
              style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
            ),
            title: Center(
              child: Text(
                'Sale',
                style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
              ),
            ),
            trailing: Text(
              'Purchase',
              style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
            ),
          ),
          const Divider(),
          _buildTransactionRow('Name', '\₹1000', '\₹4000'),
          const Divider(),
          _buildTransactionRow('Name', '\₹1000', '\₹4000'),
          const Divider(),
          _buildTransactionRow('Name', '\₹1000', '\₹4000'),
          const Divider(),
          SizedBox(
            height: 287.h,
          )
        ],
      ),
    );
  }

  Widget _buildTransactionRow(String name, String sale, String purchase) {
    return ListTile(
      leading: Text(
        name,
        style: TextStyle(color: Colorconst.cBlack, fontSize: 14.sp),
      ),
      title: Center(
          child: Text(
        sale,
        style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
      )),
      trailing: Text(
        purchase,
        style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
      ),
    );
  }
}
