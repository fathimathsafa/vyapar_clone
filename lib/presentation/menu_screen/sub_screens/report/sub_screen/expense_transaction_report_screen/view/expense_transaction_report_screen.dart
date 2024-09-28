import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ExpenseTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Expense Transaction', style: TextStyle(fontSize: 16)),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf, size: 20),
            onPressed: () {},
            tooltip: 'Download PDF',
          ),
          IconButton(
            icon: Icon(Icons.grid_on, size: 20),
            onPressed: () {},
            tooltip: 'View as Grid',
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
                      style: TextStyle(color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                    VerticalDivider(
                      thickness: 2,
                      color: Colors.grey,
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
                          style: TextStyle(fontSize: 12, color: Colors.black),
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
              SizedBox(height: 8), // Adjusted spacing between text and filters

              // Filters Chips
              Wrap(
                spacing: 8.0, // Added spacing between filter chips
                children: [
                  FilterChip(
                    backgroundColor: Colors.white,
                    label: Text('Expense category - All Categories',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: 2.0), // Reduced padding
                    visualDensity: VisualDensity.compact,
                    onSelected: (_) {},
                  ),
                  FilterChip(
                    backgroundColor: Colors.white,
                    label: Text('Expense Type - All',
                        style: TextStyle(fontSize: 12)),
                    onSelected: (_) {},
                  ),
                ],
              ),
              SizedBox(height: 100), // Spacing between filters and next section

              // Image and No Data Section
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                      'assets/images/download-removebg-preview.png'),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    Text(
                      'No Data Available',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    // SizedBox(height: 15),
                    Text(
                      'No data is available for this report. Please try\n again after making relevant changes.',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      textAlign: TextAlign.center,
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
}
