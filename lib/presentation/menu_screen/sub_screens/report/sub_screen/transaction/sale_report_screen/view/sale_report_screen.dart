import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class SaleReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sale Report', style: TextStyle(fontSize: 16)),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf, size: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.grid_on, size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Reduced padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Text(
                      "This Month",
                      style: TextStyle(color: Colorconst.cBlack),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colorconst.cBlack,
                      ),
                    ),
                    VerticalDivider(
                      thickness: 2,
                      color: Colorconst.cGrey,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '01/09/2024 TO 30/09/2024',
                          style:
                              TextStyle(fontSize: 12, color: Colorconst.cBlack),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 12), // Reduced space

              // Filters Applied Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Filters Applied:',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  OutlinedButton.icon(
                    icon: Icon(
                      Icons.filter_alt,
                      size: 16,
                    ),
                    label: Text('Filters',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(padding: EdgeInsets.all(8)),
                  ),
                ],
              ),
              SizedBox(height: 4), // Adjusted spacing between text and filters

              // Filters Chips (now directly below "Filters Applied")
              Wrap(
                spacing: 8.0, // Added spacing between filter chips
                children: [
                  FilterChip(
                    label: Text('Txns Type - Sale & Cr. Note',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    onSelected: (_) {},
                  ),
                  FilterChip(
                    label: Text('Party - All Party',
                        style: TextStyle(fontSize: 12)),
                    onSelected: (_) {},
                  ),
                ],
              ),
              SizedBox(
                  height: 12), // Spacing between filters and the next section

              // Statistics Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('No of Txns', '3'),
                  _buildStatCard('Total Sale', '₹ 10.00'),
                  _buildStatCard('Balance Due', '₹ 0.00', isPositive: true),
                ],
              ),
              SizedBox(height: 12),

              // Transaction List
              _buildTransactionCard('Gokul', 'Amount', '₹ 10.00', 'Balance',
                  '₹ 0.00', 'SALE 1', '12 SEP, 24'),
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

  Widget _buildStatCard(String title, String value, {bool isPositive = false}) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8), // Rounded corners for a softer look
      ),
      child: Container(
        width: 100, // Set fixed width
        height: 60, // Set fixed height to make it a square
        padding: const EdgeInsets.all(8.0), // Adjust padding to fit the square
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center, // Center text horizontally
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                  fontSize: 12,
                  color: isPositive ? Colors.green : Colors.black),
              textAlign: TextAlign.center, // Center value text horizontally
            ),
          ],
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
        padding: const EdgeInsets.all(10.0), // Reduced padding
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align items centrally
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black)),

                SizedBox(height: 15), // Reduced height
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label1 + ': ',
                            style: TextStyle(
                                fontSize: 12, color: Colorconst.cBlack)),
                        Text(value1,
                            style: TextStyle(
                                fontSize: 12, color: Colorconst.cBlack)),
                      ],
                    ),
                    SizedBox(width: 20), // Reduced width
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label2 + ': ',
                            style: TextStyle(
                                fontSize: 12, color: Colorconst.cBlack)),
                        Text(value2,
                            style: TextStyle(
                                fontSize: 12, color: Colorconst.cBlack)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(txnType,
                    style: TextStyle(fontSize: 12, color: Colorconst.cBlack)),
                Text(date,
                    style: TextStyle(fontSize: 12, color: Colorconst.cBlack)),
                SizedBox(height: 10), // Reduced height
              ],
            ),
          ],
        ),
      ),
    );
  }
}
