import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vyapar_clone/model/party_list_screen.dart';

class PartyListService {
  final String apiUrl =
      'https://vyapar-ot57.onrender.com/api/parties/balance'; // API URL

  // Retrieve the token from SharedPreferences
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken'); // Retrieve the stored token
  }

  Future<List<PartyModel>> fetchPartyList() async {
    try {
      final token = await getToken(); // Get the stored token

      if (token == null) {
        throw Exception('Token not found. Please log in again.');
      }

      // Set up headers including authorization
      final headers = {
        'Authorization': 'Bearer $token', // Include the token in the headers
        'Content-Type': 'application/json',
      };

      // Make the API call with the token in headers
      final response = await Dio().get(
        apiUrl,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        List data = response.data['data'];
        return data.map((party) => PartyModel.fromJson(party)).toList();
      } else {
        throw Exception('Failed to load party list');
      }
    } catch (e) {
      // Log the error
      print('Failed to load party list: $e');
      throw Exception('Failed to load party list: $e');
    }
  }
}
