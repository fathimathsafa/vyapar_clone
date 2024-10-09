import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AllPartyReportController extends GetxController {
  var isChecked = false.obs;
  var isZeroBalanceChecked = false.obs;
  var selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  var selectedParty = 'All Parties'.obs;
  var selectedSort = 'Name'.obs;

  List<String> partyTypes = ['All Parties', 'Receivables', 'Payables'];
  List<String> sortOptions = ['Name', 'Amount'];

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      selectedDate.value = DateFormat('yyyy-MM-dd').format(picked);
    }
  }
}
