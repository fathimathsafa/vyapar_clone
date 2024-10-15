import 'package:dio/dio.dart';

import '../base_url/base_url.dart';

class ApiServices {
  final ApiBaseUrl _baseUrls = ApiBaseUrl();

  final Dio _dio = Dio();

  getRequest({required String endurl}) async {
    try {
      final response = await _dio.get(_baseUrls.apiBaseUrl() + endurl);

      return response;
    } on DioException catch (e) {
      e;
      return null;
    }
  }
}
