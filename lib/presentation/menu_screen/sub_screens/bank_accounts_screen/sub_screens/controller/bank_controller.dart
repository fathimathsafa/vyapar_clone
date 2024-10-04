import 'package:get/get.dart';

class BankAccountsController extends GetxController {
  // Example of reactive state variables using GetX's Rx
  var isLoading = false.obs;

  // Add any necessary state variables or functions here
  void navigateToAddBankAccount() {
    Get.toNamed('/add-bank-account');
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize any data or API calls if needed
  }
}
