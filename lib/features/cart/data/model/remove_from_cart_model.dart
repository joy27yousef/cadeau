import 'package:cadeau/core/constant/app_endpoint.dart';

class RemoveFromCartModel {
  final bool status;
  final String message;
  final int code;

  RemoveFromCartModel({
    required this.status,
    required this.message,
    required this.code,
  });

  factory RemoveFromCartModel.fromJson(Map<String, dynamic> json) {
    return RemoveFromCartModel(
      status: json[ApiKey.status] ?? false,
      message: json[ApiKey.message] ?? '',
      code: json[ApiKey.code] ?? 0,
    );
  }
}
