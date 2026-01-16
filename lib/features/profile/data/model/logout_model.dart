import 'package:cadeau/core/data/apis/app_endpoint.dart';

class LogoutModel {
  final bool status;
  final List<dynamic> data;
  final String message;
  final int code;

  LogoutModel({
    required this.status,
    required this.data,
    required this.message,
    required this.code,
  });

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] ?? [],
      message: json[ApiKey.message] ?? "",
      code: json[ApiKey.code] ?? 0,
    );
  }
}
