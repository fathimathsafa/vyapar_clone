import 'package:get/get.dart';

class SaleOrderController extends GetxController {
  // Observable variable to track the selected button index
  var selectedButtonIndex = 0.obs;

  // Method to update the selected button index
  void updateSelectedButton(int index) {
    selectedButtonIndex.value = index;
  }
}
