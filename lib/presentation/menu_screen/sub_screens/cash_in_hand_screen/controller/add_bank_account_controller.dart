import 'package:get/get.dart';

class BankTransferController extends GetxController {
  // Reactive variables for switches
  var printBankDetails = false.obs;
  var printUPIQR = false.obs;

  // Other reactive variables for form fields
  var bankName = ''.obs;
  var openingBalance = ''.obs;
  var asOnDate = ''.obs;
  var accountHolderName = ''.obs;
  var accountNumber = ''.obs;
  var ifscCode = ''.obs;
  var branchName = ''.obs;
  var upiId = ''.obs;

  // Function to select date (you can update this logic with a date picker)
  void selectDate() {
    // Add your date picker logic and update the `asOnDate` value
  }

  // Save function to handle form submission
  void saveBankDetails() {
    // Add your save logic here
  }
}
