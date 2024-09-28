import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;
  final List<Map<String, String>> items;
  final List<String> brands; // Add this line

  const CategoryDetailScreen({
    Key? key,
    required this.categoryName,
    required this.items,
    required this.brands, // Add this line
  }) : super(key: key);

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
        title: Text(
          categoryName,
          style: const TextStyle(color: Colorconst.cBlack),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                _showBrandFilterBottomSheet(context);
              },
              icon: Icon(
                Icons.filter_list_rounded,
                color: Colorconst.cRed,
                size: 20.sp,
              ),
              label: Text(
                'Select Brand',
                style: TextStyle(color: Colorconst.cRed, fontSize: 13.sp),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colorconst.cPink,
                side: const BorderSide(color: Colorconst.cRed),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              height: 40.h,
              color: Colorconst.cGrey2,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                'Select Items',
                style: TextStyle(color: Colorconst.cGrey, fontSize: 13.sp),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          items[index]['title'] ?? '',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        subtitle: Text(
                          items[index]['subtitle'] ?? '',
                          style: const TextStyle(color: Colorconst.cGrey),
                        ),
                        trailing: Checkbox(
                          value:
                              false, // Replace with a state variable if needed
                          onChanged: (bool? value) {
                            // Handle checkbox change
                          },
                        ),
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

  void _showBrandFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              AppBar(
                  leading: const Icon(null),
                  title: Text(
                    'Filter by Brand',
                    style: TextStyle(color: Colorconst.cBlack, fontSize: 15.sp),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ]),
              // Search bar
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefix: Icon(
                      Icons.search,
                      color: Colorconst.cBlue,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Search Brands',
                  ),
                ),
              ),
              // List of brands
              Expanded(
                child: ListView.builder(
                  itemCount: brands.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            brands[index],
                            style: const TextStyle(color: Colorconst.cBlack),
                          ),
                          trailing: Checkbox(
                            value:
                                false, // Replace with a state variable if needed
                            onChanged: (bool? value) {
                              // Handle checkbox change
                            },
                          ),
                        ),
                        // Divider after each brand
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),

              // Buttons at the bottom
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
}
