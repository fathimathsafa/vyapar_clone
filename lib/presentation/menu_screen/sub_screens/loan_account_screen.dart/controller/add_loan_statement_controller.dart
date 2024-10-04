import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLoanAccountController extends GetxController {
  var dateController = TextEditingController().obs;
  var selectedLoanType = 'Cash'.obs;

  @override
  void onInit() {
    super.onInit();
    dateController.value.text = '27/09/2024'; // Default date
  }

  // Method to handle date picker
  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      dateController.value.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }
}
