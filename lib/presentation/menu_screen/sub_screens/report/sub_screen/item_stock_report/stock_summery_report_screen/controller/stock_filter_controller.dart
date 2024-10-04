import 'package:get/get.dart';

class StockFilterController extends GetxController {
  // Observable variables to hold selected item category and status
  var selectedItemCategory = 'All'.obs;
  var selectedStatus = 'Uncategorized'.obs;
  var selectedStock = 'In-Stock items'.obs;

  // Reset function to reset to default values
  // void resetFilters() {
  //   selectedItemCategory.value = 'All';
  //   selectedStatus.value = 'Uncategorized';
  // }
}
