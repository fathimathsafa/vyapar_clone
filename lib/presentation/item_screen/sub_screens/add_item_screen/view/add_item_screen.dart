import 'package:flutter/material.dart';
import 'package:vyapar_clone/presentation/item_screen/sub_screens/add_item_unit_screen/view/add_item_unit_screen.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage>
    with SingleTickerProviderStateMixin {
  bool isProductSelected = true;
  String? selectedUnit;
  bool showAdditionalFields = false; // Flag to control additional fields
  TextEditingController itemNameController = TextEditingController();

  late TabController _tabController; // For controlling the tab switching

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    itemNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Item', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt_outlined, color: Colors.blue),
            onPressed: () {
              // Handle camera icon press
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.grey),
            onPressed: () {
              // Handle settings icon press
            },
          ),
        ],
        bottom: showAdditionalFields
            ? TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(text: 'Pricing'),
                  Tab(text: 'Online Store'),
                ],
              )
            : null, // Show tabs only if additional fields are visible
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Product / Services Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isProductSelected ? 'Product' : 'Services',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Switch(
                    value: isProductSelected,
                    onChanged: (value) {
                      setState(() {
                        isProductSelected = value;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  Text(
                    isProductSelected ? 'Services' : 'Product',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Item Name Field
              TextFormField(
                controller: itemNameController,
                decoration: InputDecoration(
                  labelText: 'Item Name *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  suffixIcon: _buildUnitButton(),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty && !showAdditionalFields) {
                    setState(() {
                      showAdditionalFields = true; // Show additional fields
                    });
                  }
                },
              ),
              SizedBox(height: 16),

              // Conditionally display the rest of the form fields
              if (showAdditionalFields) ...[
                // Item Code
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Item Code',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    suffixIcon: _buildAssignCodeButton(),
                  ),
                ),
                SizedBox(height: 16),

                // Item Category
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Item Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // HSN/SAV Code
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'HSN/SAV Code',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],

              // Tabs for Pricing and Online Store
              if (showAdditionalFields)
                Container(
                  height: 300, // Set a fixed height for the TabBarView
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Pricing Tab
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Sale Price Row with Dropdown
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Sale Price',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              DropdownButton<String>(
                                value: 'Without Tax', // Default value
                                items: ['Without Tax', 'With Tax']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  // Handle dropdown change
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 16),

                          // Discount on Sale Price with Dropdown
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Disc. On Sale Price',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              DropdownButton<String>(
                                value: 'Percentage', // Default value
                                items: ['Percentage', 'Fixed Amount']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  // Handle dropdown change
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 16),

                          // Add Wholesale Price Button
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton.icon(
                              onPressed: () {
                                // Handle Add Wholesale Price logic
                              },
                              icon: Icon(Icons.add),
                              label: Text('Add Wholesale Price'),
                            ),
                          ),
                          SizedBox(height: 16),

                          // Taxes Dropdown
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text('Tax Rate',
                                    style: TextStyle(fontSize: 16)),
                              ),
                              SizedBox(width: 16),
                              DropdownButton<String>(
                                value: 'None', // Default value
                                items: ['None', '5%', '12%', '18%', '28%']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  // Handle dropdown change
                                },
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Online Store Tab
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Online Store Item Price',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Online Store Item Description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              // Spacer between form fields and buttons
              SizedBox(height: 16),

              // Cancel and Save buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle cancel
                    },
                    child: Text('Cancel', style: TextStyle(color: Colors.grey)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle save
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(100, 50),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build Unit Button
  Widget _buildUnitButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blue.shade50, width: 1), // Border color and width
          borderRadius: BorderRadius.circular(25), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade50, // Shadow color
              spreadRadius: 2, // Shadow spread radius
              blurRadius: 5, // Shadow blur radius
              offset: Offset(0, 3), // Position of the shadow
            ),
          ],
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddItemUnitPage()),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                selectedUnit ?? 'Unit',
                style: TextStyle(color: Colors.blue),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAssignCodeButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blue.shade50, width: 1), // Border color and width
          borderRadius: BorderRadius.circular(25), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade50, // Shadow color
              spreadRadius: 2, // Shadow spread radius
              blurRadius: 5, // Shadow blur radius
              offset: Offset(0, 3), // Position of the shadow
            ),
          ],
        ),
        child: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                selectedUnit ?? 'Unit',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}