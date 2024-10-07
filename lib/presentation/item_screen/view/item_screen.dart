import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/item_screen/sub_screens/add_item_screen/view/add_item_screen.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('XianInfoTech', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.blue),
          onPressed: () {
            // Handle menu press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.blue),
            onPressed: () {
              // Handle settings
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Quick Links Container
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Links',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildQuickLinkItem(
                            'assets/images/onlinestore (1).jpeg',
                            'Online\nStore'),
                        _buildQuickLinkItem(
                            'assets/images/stock.jpeg', 'Stock\nSummary'),
                        _buildQuickLinkItem(
                            'assets/images/item.jpeg', 'Item\nSettings'),
                        GestureDetector(
                          onTap: () {
                            _showAllOptions(context);
                          },
                          child: _buildQuickLinkItem(
                              'assets/images/show all.jpeg', 'Show\nAll'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Web Info Container
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Web',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Icon(Icons.share, color: Colors.blue),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildWebInfoItem(
                            'Sale Price', '₹ 10,000.00', Colors.black),
                        _buildWebInfoItem(
                            'Purchase Price', '₹ 0.00', Colors.black),
                        _buildWebInfoItem('In Stock', '0.0', Colors.green),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),

            // Add New Item Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddItemPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                'Add New Item',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show bottom sheet with 6 items
  void _showAllOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colorconst.cwhite,
          padding: EdgeInsets.all(16.0),
          height: 300, // Set height for the bottom sheet
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'More Options',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Divider(),
              SizedBox(height: 16),
              // Grid with 6 items (2 columns, 3 rows)
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3, // 3 items in a row
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildQuickLinkItem(
                        'assets/images/import items.jpeg', 'Import Items'),
                    _buildQuickLinkItem(
                        'assets/images/export items.jpeg', 'Export Items'),
                    _buildQuickLinkItem(
                        'assets/images/item wise pnl.jpeg', 'Item wise PnL'),
                    _buildQuickLinkItem('assets/images/additional field.jpeg',
                        'Additional Fields'),
                    _buildQuickLinkItem(
                        'assets/images/item details.jpeg', 'Item Details'),
                    _buildQuickLinkItem(
                        'assets/images/low stock.jpeg', 'Low Stock Sum...'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Quick Links Widget with images
  Widget _buildQuickLinkItem(String imagePath, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Image.asset(
            imagePath,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colorconst.cBlack),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Web Info Widget
  Widget _buildWebInfoItem(String label, String value, [Color? color]) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
