import 'package:dio/dio.dart';

class ProductService {
  final String baseUrl = 'http://vyapar-ot57.onrender.com/api/products/';
  final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDkzOTU4YmRjZTNiZjYzM2ZlNjQ2NCIsImlhdCI6MTcyOTU3MzI3OSwiZXhwIjoxNzI5NjA5Mjc5fQ.CrXEu6a2fmXJJpy18vZH9M8ofRnIVOqTlDAXc1L0HxY'; // Replace with your actual token

  Future<List<dynamic>> fetchProducts() async {
    try {
      Response response = await Dio().get(
        baseUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Add this line
            // Add other headers if necessary
          },
        ),
      );
      if (response.statusCode == 200) {
        return response.data['data']; // Assuming the data is in this field
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
