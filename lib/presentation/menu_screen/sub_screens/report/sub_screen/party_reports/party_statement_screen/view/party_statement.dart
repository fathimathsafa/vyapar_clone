import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class PartyStatement extends StatefulWidget {
  const PartyStatement({Key? key}) : super(key: key);

  @override
  _PartyStatementState createState() => _PartyStatementState();
}

class _PartyStatementState extends State<PartyStatement> {
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
    );
    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  } // To hold the selected date range

  String searchQuery = ''; // To hold the search query
  bool showSuggestions = false; // To control the visibility of suggestions

  // Sample search history
  final List<String> searchHistory = [
    'Party 1',
    'Party 2',
  ];

  List<String> filteredResults =
      []; // To hold filtered results based on search query

  void _filterResults() {
    filteredResults = searchHistory
        .where((item) => item.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    String startDate = selectedDateRange != null
        ? DateFormat('dd/MM/yyyy').format(selectedDateRange!.start)
        : '01/09/2024';
    String endDate = selectedDateRange != null
        ? DateFormat('dd/MM/yyyy').format(selectedDateRange!.end)
        : '30/09/2024';
    _filterResults(); // Call to filter results based on the current search query
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Party Statement',
          style: TextStyle(color: Colorconst.cBlack),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colorconst.cBlack),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: Colors.red),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.table_chart, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue.shade100,
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
                child: Column(
                  children: [
                    Row(
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
                          style: TextStyle(
                              fontSize: 13.sp, color: Colorconst.cBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Filters Apllied:",
                              style: TextStyle(
                                  color: Colorconst.cBlack, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            MaterialButton(
                              minWidth: 100.h,
                              height: 20.h,
                              shape: StadiumBorder(),
                              onPressed: () {},
                              color: Colorconst.cGrey,
                              child: Text(
                                "Theme:Vypar view",
                                style: TextStyle(color: Colorconst.cGrey2),
                              ),
                            )
                          ],
                        ),
                        MaterialButton(
                          shape: StadiumBorder(),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_alt_outlined,
                                color: Colorconst.cBlue,
                              ),
                              Text("Filter")
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
            // Search Bar
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  style: TextStyle(color: Colorconst.cBlack),
                  decoration: InputDecoration(
                    labelText: 'Search Party',
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,
                      color: Colorconst.cBlue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0.r),
                      borderSide: BorderSide.none, // Remove border line
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value; // Update the search query
                      showSuggestions =
                          value.isNotEmpty; // Show suggestions when not empty
                    });
                  },
                ),
              ),
            ),

            // Suggestions List
            if (showSuggestions && searchQuery.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filteredResults[index]),
                      onTap: () {
                        setState(() {
                          searchQuery = filteredResults[
                              index]; // Set the search query to the selected history
                          showSuggestions = false; // Hide suggestions
                          // Remove the selected item from search history
                          searchHistory.remove(filteredResults[index]);
                        });
                      },
                    );
                  },
                ),
              ),

            // Conditionally show content based on search query
            Expanded(
              child: searchQuery.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/download-removebg-preview.png",
                            height: 100.h,
                            width: 100.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle tap on text
                            },
                            child: Column(
                              children: [
                                Text(
                                  'To see the statement in full details,',
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colorconst.cGrey),
                                ),
                                Text(
                                  'Please select a party.',
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colorconst.cGrey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        // Bottom Container for Amounts and Table
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                    'Total Amount',
                                    style: TextStyle(
                                        color: Colorconst.cGrey,
                                        fontSize: 13.sp),
                                  ),
                                  Text(
                                    '\₹5000',
                                    style: TextStyle(
                                        color: Colorconst.cBlack,
                                        fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ),
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
                                    'Closing Balance',
                                    style: TextStyle(
                                        color: Colorconst.cGrey,
                                        fontSize: 13.sp),
                                  ),
                                  Text(
                                    '\₹5000',
                                    style: TextStyle(
                                        color: Colorconst.cRed,
                                        fontSize: 15.sp),
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
          ],
        ),
      ),
    );
  }

  // Transactions table
  Widget _buildTransactionsTable() {
    return Card(
      color: Colorconst.cwhite,
      margin: EdgeInsets.all(16.w),
      child: Column(
        children: [
          ListTile(
            leading: Text(
              'Txns Type',
              style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
            ),
            title: Center(
              child: Text(
                'Amount',
                style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
              ),
            ),
            trailing: Text(
              'Balance',
              style: TextStyle(color: Colorconst.cGrey, fontSize: 14.sp),
            ),
          ),
          const Divider(),
          _buildTransactionRow('Sales', '12 sep 24 sale 1', '\₹4000', '₹0.00'),
          Divider(),
          _buildTransactionRow('Sale 1', '12 sep 24 sale 1', '\₹2000', '₹0.00'),
          Divider(),
          _buildTransactionRow(
              'Payment In', '12 sep 24 sale 1', '\₹2500', '₹0.00'),
          Divider(),
          _buildTransactionRow(
              'Credit Note', '12 sep 24 sale 1', '\₹5000', '₹0.00'),
        ],
      ),
    );
  }

  // Helper method for transaction rows
  Widget _buildTransactionRow(
      String type, String date, String balance, String amount) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: TextStyle(color: Colorconst.cBlack, fontSize: 16.sp),
          ),
          Text(
            date,
            style: TextStyle(color: Colorconst.cGrey, fontSize: 13.sp),
          ),
        ],
      ),
      title: Center(child: Text(amount)),
      // title: Text(type),
      // subtitle: Text(amount),
      trailing: Text(
        balance,
        style: TextStyle(color: Colorconst.Green, fontSize: 13.sp),
      ),
    );
  }

  // Filters BottomSheet
  void _showFiltersBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(title: Text('Select Filters')),
            const Divider(),
            // Add your filter options here
          ],
        );
      },
    );
  }
}
