import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vyapar_clone/core/snackbar/my_snackbar.dart';

import '../base_url/base_url.dart';

class ApiServices {
  final ApiBaseUrl _baseUrls = ApiBaseUrl();

  final Dio _dio = Dio();

  Future<Response?> getRequest({required String endurl,String? authToken}) async {
    try {
      final options = Options(
      headers: {
        if (authToken != null) 'Authorization': 'Bearer $authToken',
      },
    );
    printApiInfo(url: _baseUrls.apiBaseUrl() + endurl,payload: options.headers);
    
      final response = await _dio.get(_baseUrls.apiBaseUrl() + endurl,options: options,);

      return response;
    } on DioException catch (e) {
      SnackBars.showErrorSnackBar(text: e.toString());
    
      return null;
    }
  }

  Future<Response?> postMultiPartData(
      {required String endUrl,
      required Map<String, dynamic> data,
      String? authToken,
      List<File?>? files,
      List<String?>? fileParameters}) async {

        
    printApiInfo(url: _baseUrls.apiBaseUrl() + endUrl, payload: data);
    try {

      final options = Options(
      headers: {
        if (authToken != null) 'Authorization': 'Bearer $authToken',
      },
    );
      FormData formData = FormData.fromMap(data);

      if (fileParameters != null &&
          files != null &&
          fileParameters.length.toInt() != 0) {
        for (int i = 0; i < fileParameters.length; i++) {
          if(files[i] !=null && fileParameters[i] !=null){
          String fileName = files[i]!.path.split('/').last;
          formData.files.add(
            MapEntry(
              fileParameters[i]!,
              await MultipartFile.fromFile(files[i]!.path, filename: fileName),
            ),
          );

          }
        }
      }

      final response = await _dio.post(
        _baseUrls.apiBaseUrl() + endUrl,
        data: formData,
        options:options,
      );

      return response;
    } on DioException catch (e) {
      print("error==${e}");
      SnackBars.showErrorSnackBar(text: e.toString());
      return null;
    }
  }

  Future<Response?> postJsonData({
    required String endUrl,
    required Map<String, dynamic> data,
    Map<String, String>? headers,
  }) async {
    printApiInfo(url: _baseUrls.apiBaseUrl() + endUrl, payload: data);
    try {
      final response = await _dio.post(
        _baseUrls.apiBaseUrl() + endUrl,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) {
          SnackBars.showErrorSnackBar(text: "You are not registered yet.");
        } else {
          SnackBars.showErrorSnackBar(
            text: "Error ${e.response?.statusCode}: ${e.response?.data}",
          );
        }
      } else {
        SnackBars.showErrorSnackBar(text: "Something went wrong!");
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
