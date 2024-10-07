import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Reports Section
                  _buildReportsSection(),
                  SizedBox(height: 20),

                  // Transaction Cards
                  _buildTransactionCards(),
                  SizedBox(height: 20),

                  // Sales Overview Card
                  _buildSalesOverviewCard(),
                  SizedBox(height: 20),

                  // Info Card
                  _buildInfoCard(),
                  SizedBox(height: 60), // Adjusted height for space for button
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 16,
          //   left: MediaQuery.of(context).size.width * 0.25, // Center the button
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // Add sale action
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.yellow.shade50,
          //       side: BorderSide(color: Colors.red, width: 2),
          //       padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          //       textStyle: TextStyle(fontSize: 18),
          //     ),
          //     child: Text(
          //       "Add Sale Now",
          //       style: TextStyle(color: Colors.red),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildReportsSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Winpar Reports',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colorconst.cBlack)),
                SizedBox(height: 8),
                Text(
                    'View more than 50 reports and gain full control of your business..',
                    style: TextStyle(color: Colors.grey.shade700)),
                SizedBox(height: 16),
                ElevatedButton(onPressed: () {}, child: Text('See Reports')),
              ],
            ),
          ),
          Expanded(
            child: Image.network(
                'https://via.placeholder.com/100'), // Placeholder image URL
          )
        ],
      ),
    );
  }

  Widget _buildTransactionCards() {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text("You'll Get", style: TextStyle(color: Colors.green)),
                  SizedBox(height: 8),
                  Text('11,69,985.95',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colorconst.cBlack)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text("You'll Give", style: TextStyle(color: Colors.red)),
                  SizedBox(height: 8),
                  Text('1,43,511.00',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colorconst.cBlack)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSalesOverviewCard() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your Sale Overview (Sep)",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colorconst.cBlack)),
            SizedBox(height: 10),
            Text(
              'Total Sale',
              style: TextStyle(color: Colorconst.cBlack),
            ),
            Text("₹ 24,000.00",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            Text("100% More Growth This Month",
                style: TextStyle(color: Colors.green)),
            SizedBox(height: 20),
            Container(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 0),
                        FlSpot(1, 1),
                        FlSpot(2, 2),
                        FlSpot(3, 5),
                        FlSpot(4, 10),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.receipt, size: 40, color: Colors.blue),
        title: Text("Billing on Vyapar"),
        subtitle: Text(
            "Adding a sale or purchase transaction takes less than a minute, easy & quick."),
      ),
    );
  }
}
