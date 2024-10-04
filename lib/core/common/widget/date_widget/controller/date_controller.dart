import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  // Observable for dropdown value
  var dropdownValue = 'This Month'.obs;

  // Observable for date range
  var selectedDateRange = Rxn<DateTimeRange>();

  // Method to update the dropdown value
  void updateDropdownValue(String newValue) {
    dropdownValue.value = newValue;
  }

  // Method to handle date range selection
  Future<void> selectDateRange(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDateRange: DateTimeRange(
        start: now.subtract(const Duration(days: 30)),
        end: now,
      ),
      // Customizing the appearance of the date range picker
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Customize the primary color
            hintColor: Colors.blue, // Customize the accent color
            textTheme: TextTheme(
              bodyMedium:
                  TextStyle(color: Colors.black), // Set text color to black
            ),
            colorScheme: ColorScheme.light(
                primary: Colors.blue), // Set primary color for the calendar
            dialogBackgroundColor: Colors.white, // Set background color
          ),
          child: child ?? SizedBox.shrink(), // Handle null child
        );
      },
    );

    if (picked != null) {
      selectedDateRange.value = picked;
    }
  }

  // Getter for formatted start date
  String get startDate => selectedDateRange.value != null
      ? DateFormat('dd/MM/yyyy').format(selectedDateRange.value!.start)
      : '01/09/2024'; // Default start date

  // Getter for formatted end date
  String get endDate => selectedDateRange.value != null
      ? DateFormat('dd/MM/yyyy').format(selectedDateRange.value!.end)
      : '30/09/2024'; // Default end date
}
