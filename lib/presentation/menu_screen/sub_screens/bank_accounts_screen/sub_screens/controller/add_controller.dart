import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddBankAccountController extends GetxController {
  // State variables
  var printBankDetails = false.obs; // Observables to track state
  var printUPIQR = false.obs;
  var selectedDate = DateTime.now().obs; // Date picker observable
  final TextEditingController controller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    controller.text =
        DateFormat('yyyy-MM-dd').format(selectedDate.value); // Set initial date
  }

  // Date picker function
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }
}
