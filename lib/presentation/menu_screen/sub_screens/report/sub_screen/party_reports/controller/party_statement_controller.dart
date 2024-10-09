import 'package:get/get.dart';

class PartyStatementController extends GetxController {
  var searchQuery = ''.obs; // Reactive search query
  var showSuggestions = false.obs; // Control the visibility of suggestions
  var filteredResults = <String>[].obs; // Reactive list for filtered results

  // Sample search history
  final List<String> searchHistory = [
    'Party 1',
    'Party 2',
  ];

  // Method to filter results based on search query
  void filterResults(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      showSuggestions.value = false;
    } else {
      showSuggestions.value = true;
      filteredResults.value = searchHistory
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  // Method to select a party and remove it from history
  void selectParty(String selectedParty) {
    searchQuery.value = selectedParty;
    showSuggestions.value = false;
    searchHistory.remove(selectedParty);
  }
}
