import 'package:cadeau/core/constant/app_endpoint.dart';

class OperationsOnFriendsModel {
  final bool status;
  final List<dynamic> data;
  final String message;
  final int code;

  OperationsOnFriendsModel({
    required this.status,
    required this.data,
    required this.message,
    required this.code,
  });

  factory OperationsOnFriendsModel.fromJson(Map<String, dynamic> json) {
    return OperationsOnFriendsModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] != null
          ? List<dynamic>.from(json[ApiKey.data])
          : [],
      message: json[ApiKey.message] ?? '',
      code: json[ApiKey.code] ?? 0,
    );
  }
}
