import 'package:get/get.dart';

class ApplyLoanController extends GetxController {
  var agreedToTOS = false.obs;
  var currentPage = 0.obs;

  final List<String> loanDescriptions = [
    'Get Collateral-Free Unsecured Loans',
    'Get Up To Rs. 10Lac Business Loan',
    '100% Digital Process',
    'Disbursal Within 48 Hours',
  ];

  // List of image URLs for the slides
  final List<String> imageUrls = [
    'assets/images/slides1.jpeg',
    'assets/images/slides2.jpeg',
    'assets/images/slides3.jpeg',
    'assets/images/slides4.jpeg',
  ];

  void toggleTOS(bool value) {
    agreedToTOS.value = value;
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void applyForLoan() {
    // Add your apply loan logic here
  }
}
