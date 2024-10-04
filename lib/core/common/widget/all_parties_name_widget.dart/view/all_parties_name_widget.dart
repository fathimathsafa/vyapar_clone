import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class AllPartyNameWidget extends StatelessWidget {
  final ValueNotifier<String>
      selectedValueNotifier; // Use ValueNotifier for selected value

  AllPartyNameWidget({required this.selectedValueNotifier});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 70.w,
            child: TextFormField(
              initialValue: 'All Parties', // Pre-filled text
              style: TextStyle(
                fontSize: 12.sp,
                color: Colorconst.cBlack, // Black color for text
              ),
              decoration: InputDecoration(
                isDense: true, // Reduce padding
              ),
            )), // Display the label
        SizedBox(width: 100.w), // Adjust width according to your needs
        ValueListenableBuilder<String>(
          valueListenable: selectedValueNotifier,
          builder: (context, selectedValue, child) {
            return DropdownButton<String>(
              value: selectedValue, // Set the currently selected value
              items: <String>['Name', 'Sale Quantity', 'Purchase Quantity']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style:
                          TextStyle(color: Colorconst.cBlack, fontSize: 14.sp)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  selectedValueNotifier.value =
                      newValue; // Update the selected value
                }
              },
            );
          },
        ),
      ],
    );
  }
}
