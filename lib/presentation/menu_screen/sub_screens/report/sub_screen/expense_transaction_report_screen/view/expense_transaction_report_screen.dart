import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

class ExpenseTransaction extends StatelessWidget {
  const ExpenseTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            const Text('Expense Transaction', style: TextStyle(fontSize: 16)),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, size: 20),
            onPressed: () {},
            tooltip: 'Download PDF',
          ),
          IconButton(
            icon: const Icon(Icons.grid_on, size: 20),
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
                    const Text(
                      "This Month",
                      style: TextStyle(color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Row(
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
              const Divider(),
              const SizedBox(height: 12), // Reduced space

              // Filters Applied Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Filters Applied:',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  OutlinedButton.icon(
                    icon: const Icon(
                      Icons.filter_alt,
                      size: 16,
                    ),
                    label: const Text('Filters',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(8)),
                  ),
                ],
              ),
              const SizedBox(
                  height: 8), // Adjusted spacing between text and filters

              // Filters Chips
              Wrap(
                spacing: 8.0, // Added spacing between filter chips
                children: [
                  FilterChip(
                    backgroundColor: Colors.white,
                    label: const Text('Expense category - All Categories',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    labelPadding: const EdgeInsets.symmetric(
                        horizontal: 2.0), // Reduced padding
                    visualDensity: VisualDensity.compact,
                    onSelected: (_) {},
                  ),
                  FilterChip(
                    backgroundColor: Colors.white,
                    label: const Text('Expense Type - All',
                        style: TextStyle(fontSize: 12)),
                    onSelected: (_) {},
                  ),
                ],
              ),
              const SizedBox(
                  height: 100), // Spacing between filters and next section

              // Image and No Data Section
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                      'assets/images/download-removebg-preview.png'),
                ),
              ),
              const SizedBox(height: 50),
              const Center(
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
