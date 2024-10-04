import 'package:get/get.dart';

class FilterController extends GetxController {
  // Observable variables to hold selected item category and status
  var selectedItemCategory = 'All'.obs;
  var selectedStatus = 'Uncategorized'.obs;

  // Reset function to reset to default values
  // void resetFilters() {
  //   selectedItemCategory.value = 'All';
  //   selectedStatus.value = 'Uncategorized';
  // }
}
