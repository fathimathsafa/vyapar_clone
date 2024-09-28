import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class PartyStatement extends StatefulWidget {
  const PartyStatement({super.key});

  @override
  _PartyStatementState createState() => _PartyStatementState();
}

class _PartyStatementState extends State<PartyStatement> {
  String selectedPeriod = 'This Month'; // Default period
  DateTimeRange? dateRange; // To hold the selected date range
  String searchQuery = ''; // To hold the search query
  bool showSuggestions = false; // To control the visibility of suggestions

  // Sample search history
  final List<String> searchHistory = [
    'Party 1',
    'Party 2',
    'Party 3',
    'Party 4',
    'Party 5'
  ];

  // Function to show a bottom sheet for period selection
  void _showPeriodBottomSheet(BuildContext context) {
    // Implementation for period selection
  }

  // Function to show a date picker for calendar icon
  Future<void> _selectDateRange(BuildContext context) async {
    // Implementation for date range selection
  }

  // Format the date range to show in the UI
  String _formatDateRange() {
    if (dateRange == null) return '10/09/2024 To 30/09/2024';
    return '${dateRange!.start.toString().substring(0, 10)} To ${dateRange!.end.toString().substring(0, 10)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Party Statement',
          style: TextStyle(color: Colorconst.cBlack),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Colorconst.cBlack,
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
            // First Row
            Container(
              color: Colorconst.cwhite,
              child: Padding(
                padding: EdgeInsets.all(6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Other widgets...
                  ],
                ),
              ),
            ),

            // Search Bar with Suggestions
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
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
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none, // Remove border line
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value; // Update the search query
                          showSuggestions = value.isNotEmpty; // Show suggestions when not empty
                        });
                      },
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
                        itemCount: searchHistory.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(searchHistory[index]),
                            onTap: () {
                              setState(() {
                                searchQuery = searchHistory[index]; // Set the search query to the selected history
                                showSuggestions = false; // Hide suggestions
                                // Implement any other actions needed when a suggestion is selected
                              });
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),

            // Expanded content based on search query
            Expanded(
              child: searchQuery.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.insert_photo, size: 100),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              // Handle tap on text
                            },
                            child: const Text(
                              'Tap to search or view history',
                              style: TextStyle(fontSize: 18),
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
                            Column(
                              children: const [
                                Text('Total Amount'),
                                Text('\$5000'),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('Balance'),
                                Text('\$2000'),
                              ],
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
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const ListTile(
            title: Text('Txns Type'),
            subtitle: Text('Amount'),
            trailing: Text('Balance'),
          ),
          const Divider(),
          _buildTransactionRow('Sales', '\$1000', '\$4000'),
          _buildTransactionRow('Purchase', '\$2000', '\$2000'),
          _buildTransactionRow('Return', '\$500', '\$2500'),
          _buildTransactionRow('Credit', '\$1500', '\$5000'),
        ],
      ),
    );
  }

  // Helper method for transaction rows
  Widget _buildTransactionRow(String type, String amount, String balance) {
    return ListTile(
      title: Text(type),
      subtitle: Text(amount),
      trailing: Text(balance),
    );
  }

  // Filters BottomSheet
  void _showFiltersBottomSheet(BuildContext context) {
    // Implementation for filters
  }
}
