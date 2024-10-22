import 'package:dio/dio.dart';
import 'package:vyapar_clone/model/add_purchase_moel.dart';

class PurchaseService {
  final Dio _dio = Dio();

  // Base URL for your API
  final String baseUrl = 'https://example.com/api';

  // Add a new purchase
  Future<void> addPurchase({
    required String date,
    required String invoiceNumber,
    required String partyName,
    required String phoneNumber,
    // required List<Purchase> items, // Assuming you have a model for the items
    required double totalAmount,
    required double receivedAmount,
    required String paymentType,
    required String stateOfSupply,
    required String description,
    String? photoUrl,
  }) async {
    try {
      final response = await _dio.post('$baseUrl/purchases/add', data: {
        'date': date,
        'invoice_number': invoiceNumber,
        'party_name': partyName,
        'phone_number': phoneNumber,
        // 'items': items.map((item) => item.toJson()).toList(),
        'total_amount': totalAmount,
        'received_amount': receivedAmount,
        'payment_type': paymentType,
        'state_of_supply': stateOfSupply,
        'description': description,
        'photo_url': photoUrl,
      });

      if (response.statusCode == 200) {
        print('Purchase added successfully');
      } else {
        print('Failed to add purchase');
      }
    } catch (e) {
      print('Error adding purchase: $e');
    }
  }

  // Fetch payment types
  Future<List<String>> getPaymentTypes() async {
    try {
      final response = await _dio.get('$baseUrl/payment-types');
      if (response.statusCode == 200) {
        return List<String>.from(response.data['payment_types']);
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching payment types: $e');
      return [];
    }
  }

  // Fetch states for the State of Supply dropdown
  Future<List<String>> getStates() async {
    try {
      final response = await _dio.get('$baseUrl/states');
      if (response.statusCode == 200) {
        return List<String>.from(response.data['states']);
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching states: $e');
      return [];
    }
  }
}
