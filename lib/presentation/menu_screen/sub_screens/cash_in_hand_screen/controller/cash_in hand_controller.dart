import 'package:get/get.dart';

class CashInHandController extends GetxController {
  // Reactive variables
  RxDouble currentCashBalance = 11.00.obs; // Example cash balance
  RxInt selectedRadioValue = 1.obs; // Radio button state for Add/Reduce Cash
  RxBool hasTransactions = false.obs; // Whether transactions exist or not

  // Method to toggle between add/reduce cash
  void setSelectedRadio(int value) {
    selectedRadioValue.value = value;
  }

  // Method to simulate fetching transactions
  void fetchTransactions() {
    // You can modify this to fetch actual transaction data
    hasTransactions.value = true; // Set this to false if no transactions
  }
}
