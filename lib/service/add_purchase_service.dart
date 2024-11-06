import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:vyapar_clone/model/add_purchase_moel.dart';

class PurchaseService {
  final Dio _dio = Dio();

  // Base URL for your API
  final String baseUrl = 'http://vyapar-ot57.onrender.com/api/purchase';

  // Get all purchases
  Future<List<AddPurchaseModel>> getPurchases() async {
    try {
      final response = await _dio.get('$baseUrl');

      if (response.statusCode == 200) {
        List<AddPurchaseModel> purchases = (response.data as List)
            .map((purchase) => AddPurchaseModel.fromJson(purchase))
            .toList();
        return purchases;
      } else {
        log('Failed to fetch purchases: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      log('Error fetching purchases: $e');
      return [];
    }
  }

  // Add a new purchase
  Future<void> addPurchase(AddPurchaseModel purchase) async {
    try {
      final response = await _dio.post('$baseUrl/add', data: purchase.toJson());

      if (response.statusCode == 200) {
        log('Purchase added successfully');
      } else {
        log('Failed to add purchase: ${response.statusCode}');
      }
    } catch (e) {
      log('Error adding purchase: $e');
    }
  }

  // Update an existing purchase
  Future<void> updatePurchase(String id, AddPurchaseModel purchase) async {
    try {
      final response = await _dio.put('$baseUrl/$id', data: purchase.toJson());

      if (response.statusCode == 200) {
        log('Purchase updated successfully');
      } else {
        log('Failed to update purchase: ${response.statusCode}');
      }
    } catch (e) {
      log('Error updating purchase: $e');
    }
  }

  // Delete a purchase
  Future<void> deletePurchase(String id) async {
    try {
      final response = await _dio.delete('$baseUrl/$id');

      if (response.statusCode == 200) {
        log('Purchase deleted successfully');
      } else {
        log('Failed to delete purchase: ${response.statusCode}');
      }
    } catch (e) {
      log('Error deleting purchase: $e');
    }
  }

  // Fetch a single purchase by its ID
  Future<AddPurchaseModel?> getPurchaseById(String id) async {
    try {
      final response = await _dio.get('$baseUrl/$id');

      if (response.statusCode == 200) {
        return AddPurchaseModel.fromJson(response.data);
      } else {
        log('Failed to fetch purchase: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error fetching purchase: $e');
      return null;
    }
  }
}
