import 'package:cadeau/core/data/apis/app_endpoint.dart';

class AddRemoveWishlistModel {
  final bool status;
  final String message;
  final int code;

  AddRemoveWishlistModel({
    required this.status,
    required this.message,
    required this.code,
  });

  factory AddRemoveWishlistModel.fromJson(Map<String, dynamic> json) {
    return AddRemoveWishlistModel(
      status: json[ApiKey.status],
      message: json[ApiKey.message],
      code: json[ApiKey.code],
    );
  }
}
