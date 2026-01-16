import 'package:cadeau/core/data/apis/app_endpoint.dart';

class SendEmailModel {
  final bool status;
  final String message;
  final int code;

  SendEmailModel({
    required this.status,
    required this.message,
    required this.code,
  });

  factory SendEmailModel.fromJson(Map<String, dynamic> json) {
    return SendEmailModel(
      status: json[ApiKey.status],
      message: json[ApiKey.message],
      code: json[ApiKey.code],
    );
  }
}
