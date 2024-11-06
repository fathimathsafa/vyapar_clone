// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:vyapar_clone/model/add_expense_model.dart';

// class AddExpenseService {
//   final Dio _dio = Dio();

//   // Base URL of your API
//   final String baseUrl =
//       'http://vyapar-ot57.onrender.com/api'; // Replace with your API base URL

//   // Add Expense
//   Future<AddExpenseModel?> addExpense(AddExpenseModel expenseData) async {
//     try {
//       final response = await _dio.post(
//         '$baseUrl/expense-category', // Adjust endpoint based on your API design
//         data: expenseData.toJson(),
//       );

//       if (response.statusCode == 200) {
//         // Parse the response into AddExpenseModel
//         return AddExpenseModel.fromJson(response.data);
//       } else {
//         log('Failed to add expense: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       log('Error in addExpense: $e');
//       return null;
//     }
//   }

//   // Get All Expenses
//   Future<List<AddExpenseModel>> getAllExpenses() async {
//     try {
//       final response = await _dio.get('$baseUrl/expenses'); // Adjust endpoint

//       if (response.statusCode == 200) {
//         // Parse the response into a list of AddExpenseModel
//         List<AddExpenseModel> expenses = (response.data as List)
//             .map((expense) => AddExpenseModel.fromJson(expense))
//             .toList();
//         return expenses;
//       } else {
//         log('Failed to fetch expenses: ${response.statusCode}');
//         return [];
//       }
//     } catch (e) {
//       log('Error in getAllExpenses: $e');
//       return [];
//     }
//   }

//   // Delete Expense by ID
//   Future<bool> deleteExpense(String id) async {
//     try {
//       final response =
//           await _dio.delete('$baseUrl/expenses/$id'); // Adjust endpoint

//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         log('Failed to delete expense: ${response.statusCode}');
//         return false;
//       }
//     } catch (e) {
//       log('Error in deleteExpense: $e');
//       return false;
//     }
//   }
// }
