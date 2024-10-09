import 'package:get/get.dart';

class PartyReportByItemsController extends GetxController {
  // Observable variables
  var selectedParty = 'All Categories'.obs;
  var selectedSort = 'Party name'.obs;

  List<String> partyTypes = ['All Categories', 'Uncategorized'];
  List<String> sortOptions = [
    'Party name',
    'Sale quantity',
    'Purchase quantity'
  ];

  // Method to change selected party
  void updateSelectedParty(String value) {
    selectedParty.value = value;
  }

  // Method to change selected sort option
  void updateSelectedSort(String value) {
    selectedSort.value = value;
  }
}
