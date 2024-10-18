import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vyapar_clone/model/add_party_model.dart';

class PartyService {
  final Dio _dio = Dio();
  final String baseUrl = 'http://vyapar-ot57.onrender.com/api/parties/';

  Future<void> addParty(Party party) async {
    try {
      final response = await _dio.post(baseUrl, data: party.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Party added successfully!');
      } else {
        log('Failed to add party: ${response.statusCode}');
      }
    } catch (e) {
      log('Error adding party: $e');
    }
  }
}
