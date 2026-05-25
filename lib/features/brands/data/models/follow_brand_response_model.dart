import 'package:cadeau/core/constant/app_endpoint.dart';

class FollowResponseModel {
  final bool? status;
  final List<dynamic>? data;
  final String? message;
  final int? code;

  FollowResponseModel({this.status, this.data, this.message, this.code});

  factory FollowResponseModel.fromJson(Map<String, dynamic> json) {
    return FollowResponseModel(
      status: json[ApiKey.status],
      data: json[ApiKey.data] != null ? List<dynamic>.from(json['data']) : null,
      message: json[ApiKey.message],
      code: json[ApiKey.code],
    );
  }
}
