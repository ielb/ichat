import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class Api {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://jongsintgillis.be/app/api/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: ""
    },
  ));

  Future<Response?> httpGet(
      {required String endpoint, Map<String, dynamic>? query}) async {
    try {
      return await _dio.get(endpoint, queryParameters: query);
    } on DioError catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<Response?> httpPost(
      {required String endpoint, Map<String, dynamic>? body}) async {
    try {
      return await _dio.request(
        endpoint,
        data: body,
        options: Options(
          method: "POST",
          contentType: "application/json",
        ),
      );
    } on DioError catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<Response?> httpPut(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? query}) async {
    try {
      return await _dio.request(
        endpoint,
        data: data,
        queryParameters: query,
        options: Options(
          method: "PUT",
          contentType: "application/json",
        ),
      );
    } on DioError catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<Response> httpDelete(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? query}) async {
    return await _dio.delete(
      endpoint,
      data: data,
      queryParameters: query,
      options: Options(
        method: "DELETE",
      ),
    );
  }

  Future<Response> httpPatch(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? query}) async {
    return await _dio.patch(
      endpoint,
      data: data,
      queryParameters: query,
      options: Options(
        method: "PATCH",
        contentType: "application/json",
      ),
    );
  }

  Future<Response> httpHead(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? query}) async {
    return await _dio.head(
      endpoint,
      data: data,
      queryParameters: query,
      options: Options(
        method: "HEAD",
      ),
    );
  }

  Future<Response> postWithFile(
      {required String endpoint,
      required File file,
      String fileKey = 'file'}) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      fileKey: await MultipartFile.fromFile(file.path, filename: fileName),
    });
    return await _dio.request(endpoint,
        data: formData, options: Options(method: "POST"));
  }
}
