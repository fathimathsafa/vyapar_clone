import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUnitController extends GetxController {
  // Observable for showing conversion rate section
  var showConversionRate = false.obs;

  // Observable to hold selected secondary unit
  var selectedSecondaryUnit = ''.obs;

  // Text controller for conversion rate input
  final TextEditingController conversionRateController = TextEditingController();

  // List of primary and secondary unit options
  final List<String> primaryUnits = ['BUNDLES (Bdl)', 'Option 1', 'Option 2'];
  final List<String> secondaryUnits = ['BAGS (Bag)', 'Option B', 'Option C'];

  // Method to handle changes in the secondary unit dropdown
  void onSecondaryUnitChanged(String? value) {
    if (value != null && value.isNotEmpty) {
      selectedSecondaryUnit.value = value; // Update the selected unit
      showConversionRate.value = true;     // Show conversion rate section
    } else {
      showConversionRate.value = false;    // Hide if no unit is selected
    }
  }

  // Method to handle save action
  void onSave() {
    // Handle logic for saving the unit and conversion rate
    String conversionRate = conversionRateController.text;
    String selectedUnit = selectedSecondaryUnit.value;

    if (conversionRate.isEmpty || selectedUnit.isEmpty) {
      Get.snackbar("Error", "Please complete all fields");
    } else {
      // Save the conversion rate and selected unit (you can add your logic here)
      Get.snackbar("Success", "Unit and conversion rate saved successfully");
    }
  }

  // // Method to handle delete action
  // void onDelete() {
  //   // Logic for deleting the unit or resetting the form
  //   conversionRateController.clear(); // Clear conversion rate input
  //   selectedSecondaryUnit.value = ''; // Clear selected unit
  //   showConversionRate.value = false; // Hide conversion rate section
  //   Get.snackbar("Deleted", "Unit and conversion rate deleted");
  // }

  @override
  void onClose() {
    conversionRateController.dispose(); // Dispose controller when no longer needed
    super.onClose();
  }
}
