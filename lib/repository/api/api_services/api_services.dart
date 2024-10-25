import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:vyapar_clone/core/snackbar/my_snackbar.dart';

import '../base_url/base_url.dart';

class ApiServices {
  final ApiBaseUrl _baseUrls = ApiBaseUrl();

  final Dio _dio = Dio();
  void initDio() {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<Response?> getRequest(
      {required String endurl, String? authToken}) async {
    try {
      initDio();
      final options = Options(
        headers: {
          if (authToken != null) 'Authorization': 'Bearer $authToken',
        },
      );
      printApiInfo(
          url: _baseUrls.apiBaseUrl() + endurl, payload: options.headers);

      final response = await _dio.get(
        _baseUrls.apiBaseUrl() + endurl,
        options: options,
      );

      return response;
    } on DioException catch (e) {
      SnackBars.showErrorSnackBar(text: e.toString());

      return null;
    }
  }

  Future<Response?> postMultiPartData(
      {required String endUrl,
      required FormData data,
      String? authToken,
      List<File?>? files,
      List<String?>? fileParameters}) async {
    printApiInfo(
        url: _baseUrls.apiBaseUrl() + endUrl, payload: data.toString());

    try {
      initDio();
      final options = Options(
        // contentType: 'application/x-www-form-urlencoded',
        headers: {
          if (authToken != null) 'Authorization': 'Bearer $authToken',
        },
      );

      printApiInfo(url: _baseUrls.apiBaseUrl() + endUrl, payload: data.fields);
      printApiInfo(url: _baseUrls.apiBaseUrl() + endUrl, payload: data.files);

      final response = await _dio.post(
        _baseUrls.apiBaseUrl() + endUrl,
        data: data,
        options: options,
      );

      return response;
    } on DioException catch (e) {
      print("error==${e}");
      SnackBars.showErrorSnackBar(text: e.toString());
      return null;
    }
  }

  Future<Response?> postJsonData(
      {required String endUrl,
      required Map<String, dynamic> data,
      Map<String, String>? headers,
      String? authToken}) async {
    initDio();
    printApiInfo(
      url: _baseUrls.apiBaseUrl() + endUrl,
      payload: data,
    );
    final options = Options(
      // contentType: 'application/x-www-form-urlencoded',
      headers: {
        if (authToken != null) 'Authorization': 'Bearer $authToken',
      },
    );
    try {
      final response = await _dio.post(_baseUrls.apiBaseUrl() + endUrl,
          data: data, options: authToken != null ? options : null);

      return response;
    } on DioException catch (e) {
      print("error response==${e}");
      if (e.response != null) {
        if (e.response?.statusCode == 404) {
          SnackBars.showErrorSnackBar(text: "You are not registered yet.");
        } else {
          SnackBars.showErrorSnackBar(
            text: "Error ${e.response?.statusCode}: ${e.response?.data}",
          );
        }
      } else {
        SnackBars.showErrorSnackBar(
            text: "Something went wrong! ${e.response?.data}");
      }
      return null;
    }
  }
}

void printApiInfo({url, payload}) {
  print("api hitting----------------");
  print("api url----------------$url");
  print("api payload----------------$payload");
  print("finished api call----------------");
}
