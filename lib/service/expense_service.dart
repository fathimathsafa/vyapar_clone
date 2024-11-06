import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vyapar_clone/model/expense_model.dart';

class ExpenseService {
  final Dio _dio = Dio();

  // Base URL of the API
  final String baseUrl = "http://vyapar-ot57.onrender.com/api/expense-category";

  // Fetch list of expenses
  Future<List<ExpenseModel>> fetchExpenses() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((expense) => ExpenseModel.fromJson(expense)).toList();
      }
      return [];
    } catch (e) {
      // Handle error
      log("Error fetching expenses: $e");
      return [];
    }
  }

  // Add a new expense
  Future<bool> addExpense(ExpenseModel expenseModel) async {
    try {
      final response = await _dio.post(
        baseUrl,
        data: expenseModel.toJson(),
      );
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      log("Error adding expense: $e");
      return false;
    }
  }

  // Update an existing expense
  Future<bool> updateExpense(ExpenseModel expenseModel) async {
    try {
      final response = await _dio.put(
        "$baseUrl/${expenseModel.id}",
        data: expenseModel.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log("Error updating expense: $e");
      return false;
    }
  }

  // Delete an expense by ID
  Future<bool> deleteExpense(String id) async {
    try {
      final response = await _dio.delete("$baseUrl/$id");
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log("Error deleting expense: $e");
      return false;
    }
  }
}
