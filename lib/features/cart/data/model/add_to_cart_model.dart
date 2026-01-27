import 'package:cadeau/core/data/apis/app_endpoint.dart';

class AddToCartModel {
  final bool status;
  final String message;
  final int code;

  AddToCartModel({
    required this.status,
    required this.message,
    required this.code,
  });

  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(
      status: json[ApiKey.status] == true,
      message: json[ApiKey.message] ?? '',
      code: json[ApiKey.code] ?? 0,
    );
  }
}
