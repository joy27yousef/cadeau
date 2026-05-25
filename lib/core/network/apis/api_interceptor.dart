// core/data/apis/api_interceptor.dart

import 'package:cadeau/core/cache/cacheHelper.dart';
import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final sendToken = options.extra['sendToken'] ?? true;

    if (sendToken) {
      final token = CacheHelper().getData(key: GeneralKey.token);
      if (token != null && token.toString().isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      } else {
        print('😭😭😭😭😭No token');
      }
    }

    super.onRequest(options, handler);
  }
}
