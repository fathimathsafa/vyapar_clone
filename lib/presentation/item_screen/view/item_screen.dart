import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/item_screen/sub_screens/add_item_screen/view/add_item_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/dash_board_screen.dart/view/dash_board_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/setting/sub_settings/item/view/item.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/others/sub_others/vyaprar_premium/view/vyapar_premium.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/stock_summery_report_screen/view/stock_summery_report_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/export_item_screen/view/export_item_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/import_item_screen/view/import_item_screen.dart';
import 'package:vyapar_clone/service/item_service.dart';

class ItemPage extends StatelessWidget {
  final ProductService productService = ProductService();

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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashBoardOnlineScreen(),
                              ),
                            );
                          },
                          child: _buildQuickLinkItem(
                              'assets/images/onlinestore (1).jpeg',
                              'Online\nStore'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StockSummaryScreen(),
                              ),
                            );
                          },
                          child: _buildQuickLinkItem(
                              'assets/images/stock.jpeg', 'Stock\nSummary'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemScreen(),
                              ),
                            );
                          },
                          child: _buildQuickLinkItem(
                              'assets/images/item.jpeg', 'Item\nSettings'),
                        ),
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

            // Web Info Container with FutureBuilder
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
                child: FutureBuilder<List<dynamic>>(
                  future: productService.fetchProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Failed to load products'));
                    } else if (snapshot.hasData) {
                      var products = snapshot.data ?? [];

                      // Display the first product's info as a sample
                      if (products.isNotEmpty) {
                        var product = products[0];
                        return Column(
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
                                _buildWebInfoItem('Sale Price',
                                    '₹ ${product['salePrice']}', Colors.black),
                                _buildWebInfoItem(
                                    'Purchase Price',
                                    '₹ ${product['purchasePrice']}',
                                    Colors.black),
                                _buildWebInfoItem(
                                    'In Stock',
                                    '${product['stock']['openingStock']}',
                                    Colors.green),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return Center(child: Text('No products available'));
                      }
                    }
                    return Container();
                  },
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImportItemsScreen(),
                          ),
                        );
                      },
                      child: _buildQuickLinkItem(
                          'assets/images/import items.jpeg', 'Import Items'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExportItemScreen(),
                          ),
                        );
                      },
                      child: _buildQuickLinkItem(
                          'assets/images/export items.jpeg', 'Export Items'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VyaparPremiumScreen(),
                          ),
                        );
                      },
                      child: _buildQuickLinkItem(
                          'assets/images/item wise pnl.jpeg', 'Item wise PnL'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VyaparPremiumScreen(),
                          ),
                        );
                      },
                      child: _buildQuickLinkItem(
                          'assets/images/additional field.jpeg',
                          'Additional Fields'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VyaparPremiumScreen(),
                          ),
                        );
                      },
                      child: _buildQuickLinkItem(
                          'assets/images/bulk import.jpeg', 'Bulk Import'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VyaparPremiumScreen(),
                          ),
                        );
                      },
                      child: _buildQuickLinkItem(
                          'assets/images/itemwise discount.jpeg',
                          'Itemwise Discount'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Method to build Quick Link Item
  Widget _buildQuickLinkItem(String imagePath, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Method to build Web Info Item
  Widget _buildWebInfoItem(String title, String value, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
