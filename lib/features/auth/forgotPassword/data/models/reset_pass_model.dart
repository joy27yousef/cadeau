import 'package:cadeau/core/constant/app_endpoint.dart';

class ResetPassModel {
  final bool status;
  final String message;
  final int code;

  ResetPassModel({
    required this.status,
    required this.message,
    required this.code,
  });

  factory ResetPassModel.fromJson(Map<String, dynamic> json) {
    return ResetPassModel(
      status: json[ApiKey.status],
      message: json[ApiKey.message],
      code: json[ApiKey.code],
    );
  }
}
