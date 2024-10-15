import 'dart:io';

import 'package:dio/dio.dart';

import '../base_url/base_url.dart';

class ApiServices {
  final ApiBaseUrl _baseUrls = ApiBaseUrl();

  final Dio _dio = Dio();

  Future<Response?> getRequest({required String endurl}) async {
    try {
      final response = await _dio.get(_baseUrls.apiBaseUrl() + endurl);

      return response;
    } on DioException catch (e) {
      e;
      return null;
    }
  }

  Future<Response?> postRequest(
      {required String endUrl,
      required Map<String, dynamic> data,
      Map<String, String>? headers,
      List<File>? files,
      List<String>? fileParameters}) async {
    try {
      FormData formData = FormData.fromMap(data);

      if (fileParameters != null &&
          files != null &&
          fileParameters.length.toInt() != 0) {
        for (int i = 0; i < fileParameters.length; i++) {
          String fileName = files[i].path.split('/').last;
          formData.files.add(
            MapEntry(
              fileParameters[i],
              await MultipartFile.fromFile(files[i].path, filename: fileName),
            ),
          );
        }
      }

      final response = await _dio.post(
        _baseUrls.apiBaseUrl() + endUrl,
        data: formData,
        options: headers == null ? null : Options(headers: headers),
      );

      return response;
    } on DioException catch (e) {
     e;
      return null;
    }
  }
}
