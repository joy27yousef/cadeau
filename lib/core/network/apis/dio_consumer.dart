import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/apis/api_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = AppEndpoint.server;
    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);

    dio.interceptors.add(ApiInterceptor());

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: true,
        ),
      );
    }
  }

  Future<dynamic> _request(
    String method,
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    bool withToken = true,
  }) async {
    try {
      Object? finalData = data;
      if (isFormData && data is Map<String, dynamic>) {
        finalData = FormData.fromMap(data);
      }

      final response = await dio.request(
        path,
        data: finalData,
        queryParameters: queryParameters,
        options: Options(method: method, extra: {'sendToken': withToken}),
      );

      return response.data;
    } on DioException catch (e) {
      throw handleDioExceptions(e);
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool withToken = true,
  }) {
    return _request(
      'GET',
      path,
      data: data,
      queryParameters: queryParameters,
      withToken: withToken,
    );
  }

  @override
  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    bool withToken = true,
  }) {
    return _request(
      'POST',
      path,
      data: data,
      queryParameters: queryParameters,
      isFormData: isFormData,
      withToken: withToken,
    );
  }

  @override
  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    bool withToken = true,
  }) {
    return _request(
      'PATCH',
      path,
      data: data,
      queryParameters: queryParameters,
      isFormData: isFormData,
      withToken: withToken,
    );
  }

  @override
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    bool withToken = true,
  }) {
    return _request(
      'DELETE',
      path,
      data: data,
      queryParameters: queryParameters,
      isFormData: isFormData,
      withToken: withToken,
    );
  }
}
