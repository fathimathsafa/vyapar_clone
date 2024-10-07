import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PartyTransferController extends GetxController {
  var selectedDate = DateTime.now().obs; // Reactive date
  var isReceived = true.obs; // Reactive toggle between received and paid
  var selectedParty1 = ''.obs; // Party 1 selection
  var selectedParty2 = ''.obs; // Party 2 selection

  // List of parties (dummy data for now)
  var parties =
      ['Party 1', 'Party 2', 'Party 3'].obs; // Reactive list of parties

  // Function to select date
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked; // Updates the reactive variable
    }
  }

  // Function to toggle between received and paid
  void toggleReceivedPaid() {
    isReceived.value = !isReceived.value; // Toggle the value
  }

  // Function to add a new party
  void addParty(String newParty) {
    parties.add(newParty); // Add the new party to the list
  }
}
