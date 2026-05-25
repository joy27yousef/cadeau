// core/data/error/server_exception.dart

import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({required this.message, this.statusCode});

  @override
  String toString() => "ServerException: $message (Status Code: $statusCode)";
}

class CacheException implements Exception {
  final String? message;

  const CacheException({this.message});
}

class ValidationException implements Exception {
  final String message;

  const ValidationException({required this.message});
}

ServerException handleDioExceptions(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return const ServerException(
        message: "انتهت مهلة الاتصال بالسيرفر، يرجى المحاولة لاحقاً",
      );
    case DioExceptionType.sendTimeout:
      return const ServerException(
        message: "انتهت مهلة إرسال البيانات، تحقق من الشبكة",
      );
    case DioExceptionType.receiveTimeout:
      return const ServerException(
        message: "انتهت مهلة استقبال البيانات من السيرفر",
      );
    case DioExceptionType.badResponse:
      return _handleBadResponse(error.response);
    case DioExceptionType.cancel:
      return const ServerException(
        message: "تم إلغاء الطلب المرسل إلى السيرفر",
      );
    case DioExceptionType.connectionError:
      return const ServerException(
        message: "فشل الاتصال بالإنترنت، يرجى التحقق من الشبكة",
      );
    default:
      return const ServerException(
        message: "حدث خطأ غير متوقع، يرجى المحاولة لاحقاً",
      );
  }
}

ServerException _handleBadResponse(Response? response) {
  final statusCode = response?.statusCode;
  String message = "حدث خطأ ما في السيرفر";

  if (response?.data != null && response?.data is Map) {
    final data = response!.data as Map<String, dynamic>;
    // استخراج ذكي وآمن لرسائل الخطأ القادمة من السيرفر
    message = (data['message'] ?? data['error'] ?? message).toString();
  } else {
    if (statusCode == 400) {
      message = "طلب خاطئ، يرجى التحقق من البيانات المرسلة";
    }
    if (statusCode == 401) {
      message = "غير مصرح لك بالدخول، يرجى تسجيل الدخول مجدداً";
    }
    if (statusCode == 403) message = "ليس لديك الصلاحية للوصول إلى هذا الجزء";
    if (statusCode == 404) message = "الرابط المطلوب غير موجود";
    if (statusCode == 500) {
      message = "مشكلة داخلية في السيرفر، يرجى المحاولة لاحقاً";
    }
  }

  return ServerException(message: message, statusCode: statusCode);
}
