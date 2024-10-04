import 'package:get/get.dart';

class PaymentTransactionController extends GetxController {
  // State variable to simulate data fetching
  var hasData = false.obs; // Use RxBool for reactive variable

  // Method to toggle data fetching for testing
  void toggleData() {
    hasData.value = !hasData.value; // Toggle the data state
  }

  // Add any other methods related to transactions here
}
