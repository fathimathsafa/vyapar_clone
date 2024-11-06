import 'package:get/get.dart';
import 'package:vyapar_clone/model/expense_model.dart';
import 'package:vyapar_clone/service/expense_service.dart';

class ExpenseController extends GetxController {
  final ExpenseService _expenseService = ExpenseService();
  var expenses = <ExpenseModel>[].obs; // Observable list of expenses
  var selectedExpenseTabIndex = 0.obs;

  // Fetch expenses from the service
  void fetchExpenses() async {
    var fetchedExpenses = await _expenseService.fetchExpenses();
    expenses.assignAll(fetchedExpenses);
  }

  @override
  void onInit() {
    super.onInit();
    fetchExpenses(); // Fetch expenses when the controller is initialized
  }
}
