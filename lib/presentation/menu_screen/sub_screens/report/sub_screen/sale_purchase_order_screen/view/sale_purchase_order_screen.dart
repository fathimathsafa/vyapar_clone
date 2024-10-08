import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/view/date_widget.dart';

class SalePurchaseOrderItemReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Order Item Report', style: TextStyle(fontSize: 16)),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Range and Filters
            DateDropdownAndPicker(),
            const Divider(),
            SizedBox(height: 12),

            // Filters Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Type",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                Text(
                  "Sale Order",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Party Name Filter
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Party Name',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    DropdownButton<String>(
                      value: 'All parties',
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'All parties',
                        'Party A',
                        'Party B',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(color: Colors.black)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Add functionality for dropdown
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Status',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    DropdownButton<String>(
                      value: 'Open orders',
                      items: <String>['Open orders', 'Closed orders']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(color: Colors.black)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Add functionality for dropdown
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // Table Headers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Item Name',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Text('Qty',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Text('Amount',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Example data length
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Item $index',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '0.0',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '₹0.00',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Total Section
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                Text('0.0',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                Text('₹0.00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
