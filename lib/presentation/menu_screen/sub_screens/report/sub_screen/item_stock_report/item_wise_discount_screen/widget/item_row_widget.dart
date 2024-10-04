import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemRow extends StatelessWidget {
  final String itemName;
  final String categoryName;

  const ItemRow({
    Key? key,
    required this.itemName,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Item name text
        Text(
          itemName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 10.w), // Spacing between elements

        // Expanded to prevent overflow
        Expanded(
          child: TextFormField(
            initialValue: 'Item Name', // Pre-filled text
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black, // Black color for text
            ),
            decoration: InputDecoration(
              border: InputBorder.none, // No border
              isDense: true, // Reduce padding
            ),
          ),
        ),

        // Vertical divider
        const VerticalDivider(
          color: Colors.grey,
          thickness: 1,
        ),

        SizedBox(width: 10.w), // Spacing between divider and category

        // Category text
        Text(
          categoryName,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),

        SizedBox(width: 10.w), // Spacing between category and dropdown

        // Dropdown button with all values as "Uncategorized"
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value:
                'Uncategorized', // Make sure this value exists in the dropdown items
            icon: Icon(Icons.arrow_drop_down, color: Colors.black, size: 24.sp),
            items: <String>['Uncategorized'] // Only one 'Uncategorized' value
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(fontSize: 14.sp)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle dropdown change
            },
          ),
        ),
      ],
    );
  }
}
