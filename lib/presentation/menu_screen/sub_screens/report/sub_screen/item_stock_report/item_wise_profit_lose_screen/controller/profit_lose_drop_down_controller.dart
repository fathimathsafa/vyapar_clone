import 'package:get/get.dart';

class ProfitLoseDropdownController extends GetxController {
  // This will store the selected value
  var selectedValue = 'Name'.obs;

  // List of dropdown items
  List<String> dropdownItems = ['Name', 'Account', ];

  // Method to change the selected value
  void setSelected(String value) {
    selectedValue.value = value;
  }
}
