import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/import_item_screen/sub_screens/category_item_screen/view/category_item_screen.dart';

class ItemLibraryScreen extends StatefulWidget {
  @override
  State<ItemLibraryScreen> createState() => _ItemLibraryScreenState();
}

class _ItemLibraryScreenState extends State<ItemLibraryScreen> {
  // Map to keep track of which checkboxes are checked
  Map<String, bool> selectedFilters = {
    'Pharma': false,
    'FMCG, General Stores': false,
    'Electronics & Accessories': false,
    'Others': false,
  };

  // List of category names
  final List<String> categories = [
    'Pain Analgesics',
    'Opthal',
    'Detergents and Washing Soaps',
    'Chocolates and Toffees',
    'Cold Drinks and Beverages',
    'Pooja Items',
    'Soaps, Shampoos and Bathroom Items',
    'Cooking Items',
    'Baby Food and Care',
    'Immunity and Health',
    // 'Anti Intectives',
    // 'Dry Fruits',
    // 'Cereal,Namkeen and Snacks',
    // 'Ready to Eat',
    // 'General Medical Items',
    // 'Vitamin Mineral Nutrients',
    // 'Anti Malarials',
    // 'Diary',
    // 'Ice Creams',
    // 'Anti Neoplastic',
    // 'Otologicals',
    // 'Gastro Intestinal',
    // 'Stomatologicals',
    // 'House Hold Items',
    // 'Vaccines',
    // 'Bakery Items',
    // 'Cosmetics',
    // 'Tobaco',
    // 'Stationary',
    // 'Car Items',
    // 'Pet Food',
    // 'Mobile Phones',
    // 'Opthal Otologicals',
    // 'Respiratory',
    // 'Blood Related',
    // 'Anti Diabetics',
    // 'Others',
    // 'Urology',
  ];
  final Map<String, List<Map<String, String>>> categoryItems = {
    'Pain Analgesics': [
      {'title': 'Coxineb 120mg Tablet', 'subtitle': 'Sale Price : ₹ 116.00'},
      {'title': 'Coxineb 90mg Tablet', 'subtitle': 'Sale Price : ₹ 98.00'},
      {'title': 'Coxineb-THM Tablet', 'subtitle': 'Sale Price : ₹ 211.00'},
    ],
    'Opthal': [
      {'title': 'Paracol Eye Drop', 'subtitle': 'Sale Price : ₹ 22.00'},
      {'title': 'Parinose Eyw Drop', 'subtitle': 'Sale Price : ₹ 98.00'},
      {'title': 'Paripher Eye drop', 'subtitle': 'Sale Price : ₹ 211.00'},
    ],
    'Detergents and Washing Soaps': [
      {'title': 'Bisk Farm Tidbit ', 'subtitle': 'Sale Price : ₹ 98.00'},
      {'title': 'Vival', 'subtitle': 'Sale Price : ₹ 98.00'},
    ],
    'Chocolates and Toffees': [
      {'title': 'Bisk Farm Tidbit ', 'subtitle': 'Sale Price : ₹ 98.00'},
      {'title': 'Vival', 'subtitle': 'Sale Price : ₹ 98.00'},
    ],
    'Cold Drinks and Beverages': [
      {'title': 'Bisk Farm Tidbit ', 'subtitle': 'Sale Price : ₹ 98.00'},
      {'title': 'Vival', 'subtitle': 'Sale Price : ₹ 98.00'},
    ],
    'Pooja Items': [
      {'title': 'Bisk Farm Tidbit ', 'subtitle': 'Sale Price : ₹ 98.00'},
      {'title': 'Vival', 'subtitle': 'Sale Price : ₹ 98.00'},
    ],
    'Soaps, Shampoos and Bathroom Items': [
      {'title': 'Bisk Farm Tidbit ', 'subtitle': 'Sale Price : ₹ 98.00'},
      {'title': 'Vival', 'subtitle': 'Sale Price : ₹ 98.00'},
    ],
    'Baby Food and Care': [
      {'title': 'Bisk Farm Tidbit ', 'subtitle': 'Sale Price : ₹ 98.00'},
      {'title': 'Vival', 'subtitle': 'Sale Price : ₹ 98.00'},
    ],
    'Cooking Items': [
      {'title': 'Bisk Farm Tidbit ', 'subtitle': 'Sale Price : ₹ 98.00'},
      {'title': 'Vival', 'subtitle': 'Sale Price : ₹ 98.00'},
    ],
    'Immunity and Health': [
      {'title': 'Bisk Farm Tidbit ', 'subtitle': 'Sale Price : ₹ 98.00'},
      {'title': 'Vival', 'subtitle': 'Sale Price : ₹ 98.00'},
    ],

    // Add other items...
  };
  final Map<String, List<Map<String, String>>> categoryBrands = {
    'Pain Analgesics': [
      {
        'name': 'Brand A',
      },
      {
        'name': 'Brand B',
      },
    ],
    'Opthal': [
      {
        'name': 'Brand C',
      },
      {
        'name': 'Brand D',
      },
    ],
    'Detergents and Washing Soaps': [
      {
        'name': 'Brand E',
      },
      {
        'name': 'Brand F',
      },
    ],
    'Chocolates and Toffees': [
      {
        'P': 'Brand A',
      },
      {
        'name': 'Brand B',
      },
    ],
    'Cold Drinks and Beverages': [
      {
        'name': 'Brand C',
      },
      {
        'name': 'Brand D',
      },
    ],
    'Pooja Items': [
      {
        'name': 'Brand E',
      },
      {
        'name': 'Brand F',
      },
    ],
    'Soaps, Shampoos and Bathroom Item': [
      {
        'P': 'Brand A',
      },
      {
        'name': 'Brand B',
      },
    ],
    'Baby Food and Care': [
      {
        'name': 'Brand C',
      },
      {
        'name': 'Brand D',
      },
    ],
    'Cooking Items': [
      {
        'name': 'Brand E',
      },
      {
        'name': 'Brand F',
      },
    ],
    'Immunity and Health': [
      {
        'P': 'Brand A',
      },
      {
        'name': 'Brand B',
      },
    ],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Item Library',
          style: TextStyle(color: Colorconst.cBlack),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter Button
            ElevatedButton.icon(
              onPressed: () {
                _showFilterBottomSheet(context);
              },
              icon: Icon(
                Icons.filter_list_rounded,
                color: Colorconst.cRed,
                size: 20.sp,
              ),
              label: Text(
                'Filter by Industry',
                style: TextStyle(color: Colorconst.cRed, fontSize: 13.sp),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colorconst.cPink,
                side: const BorderSide(color: Colorconst.cRed),
              ),
            ),
            SizedBox(height: 10.h),

            // Grey Container with Select Category Text
            Container(
              width: double.infinity,
              height: 40.h,
              color: Colorconst.cGrey2,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                'Select a Category',
                style: TextStyle(color: Colorconst.cGrey, fontSize: 13.sp),
              ),
            ),
            SizedBox(height: 10.h),

            // List of Categories with Divider
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryDetailScreen(
                                categoryName: categories[index],
                                items: categoryItems[categories[index]] ?? [],
                                brands:
                                    (categoryBrands[categories[index]] ?? [])
                                        .map((brand) =>
                                            brand['name'] ??
                                            '') // Extract brand names
                                        .toList(),
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              categories[index], // Use the category name
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colorconst.cBlack),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colorconst.cBlue,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the filter bottom sheet
  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Heading and Close Icon
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('FILTER INDUSTRY',
                      style:
                          TextStyle(fontSize: 18.sp, color: Colorconst.cBlack)),
                  const Icon(Icons.close, color: Colors.black),
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(),

              // Industry List with Checkboxes
              _buildFilterOption('Pharma'),
              const Divider(),
              _buildFilterOption('FMCG, General Stores'),
              const Divider(),
              _buildFilterOption('Electronics & Accessories'),
              const Divider(),
              _buildFilterOption('Others'),
              const Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50.h, // Set the desired height for both buttons
                      child: OutlinedButton(
                        onPressed: () {
                          // Clear all selections
                          // setState(() {
                          //   selectedFilters.updateAll((key, value) => false);
                          // });
                        },
                        child: const Text('Clear All',
                            style: TextStyle(color: Colorconst.cBlack)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colorconst.cGrey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w), // Add spacing between buttons
                  Expanded(
                    child: SizedBox(
                      height: 50.h, // Set the desired height for both buttons
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Apply',
                            style: TextStyle(color: Colorconst.cwhite)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colorconst.cBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  // Helper method to build filter options with checkboxes
  Widget _buildFilterOption(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 16.sp, color: Colors.black)),
        Checkbox(
          value: selectedFilters[label], // Set the checkbox state
          onChanged: (bool? value) {
            setState(() {
              selectedFilters[label] =
                  value ?? false; // Toggle the checkbox state
            });
          },
          activeColor: Colors.black,
        ),
      ],
    );
  }
}
