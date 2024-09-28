import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/sale/sales_return/sub_screens/credit_note/view/credit_note.dart';

class SaleReturnScreen extends StatefulWidget {
  @override
  _SaleReturnScreenState createState() => _SaleReturnScreenState();
}

class _SaleReturnScreenState extends State<SaleReturnScreen> {
  DateTime startDate = DateTime.now().subtract(Duration(days: 30));
  DateTime endDate = DateTime.now();
  String selectedRange = 'This Month';

  void _showDateRangePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Today'),
                onTap: () {
                  setState(() {
                    selectedRange = 'Today';
                    startDate = DateTime.now();
                    endDate = DateTime.now();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('This Week'),
                onTap: () {
                  setState(() {
                    selectedRange = 'This Week';
                    final now = DateTime.now();
                    startDate = now.subtract(Duration(days: now.weekday - 1));
                    endDate = now;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('This Month'),
                onTap: () {
                  setState(() {
                    selectedRange = 'This Month';
                    final now = DateTime.now();
                    startDate = DateTime(now.year, now.month, 1);
                    endDate = DateTime(now.year, now.month + 1, 0);
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('This Quarter'),
                onTap: () {
                  setState(() {
                    selectedRange = 'This Quarter';
                    final now = DateTime.now();
                    int quarter = (now.month - 1) ~/ 3 + 1;
                    startDate = DateTime(now.year, (quarter - 1) * 3 + 1, 1);
                    endDate = DateTime(now.year, quarter * 3 + 1, 0);
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('This Financial Year'),
                onTap: () {
                  setState(() {
                    selectedRange = 'This Financial Year';
                    final now = DateTime.now();
                    startDate = DateTime(now.year, 4,
                        1); // Assuming financial year starts in April
                    endDate = DateTime(now.year + 1, 3, 31);
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Custom'),
                onTap: () {
                  // You can implement custom date range logic here
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Sale Return'),
          centerTitle: true,
          backgroundColor: Colors.white),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Date Range Picker
          Divider(
            color: Colors.black,
            indent: 15,
            endIndent: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: _showDateRangePicker,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedRange,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.keyboard_arrow_down_outlined,
                        color: Colors.blue),
                    VerticalDivider(
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.blue,
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Text(DateFormat('dd/MM/yyyy').format(startDate)),
                        Text(" TO "),
                        Text(DateFormat('dd/MM/yyyy').format(endDate)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            indent: 15,
            endIndent: 15,
          ),
          SizedBox(
            height: 10,
          ),
          // Placeholder for No Data Available
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSummaryCard('No of Txns', '1'),
              _buildSummaryCard('Total Sale Return', '₹ 10000.00'),
              _buildSummaryCard('Balance Due', '₹ 0.00'),
            ],
          ),
          SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gokul',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'SALE 1',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  '12 SEP, 24',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Amount'),
                                SizedBox(height: 4),
                                Text(
                                  '₹ 10000.00',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Balance'),
                                SizedBox(height: 4),
                                Text(
                                  '₹ 0.00',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .green, // Apply green color only to 0.00 text
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
          Spacer(),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16.0,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreditNoteScreen(),
                  ),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Add Sale'),
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
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color ?? Colors.blue[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 11, color: Colors.grey[600])),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: value == '₹ 0.00'
                    ? Colors.green
                    : Colors.black, // Apply green color conditionally
              ),
            ),
          ],
        ),
      ),
    );
  }
}