import 'package:cadeau/core/constant/app_endpoint.dart';

class IsFollowingBrandModel {
  final bool? status;
  final CheckFollowData? data;
  final String? message;
  final int? code;

  IsFollowingBrandModel({this.status, this.data, this.message, this.code});

  factory IsFollowingBrandModel.fromJson(Map<String, dynamic> json) {
    return IsFollowingBrandModel(
      status: json[ApiKey.status],
      data: json[ApiKey.data] != null
          ? CheckFollowData.fromJson(json[ApiKey.data])
          : null,
      message: json[ApiKey.message],
      code: json[ApiKey.code],
    );
  }
}

class CheckFollowData {
  final bool isFollowing;

  CheckFollowData({required this.isFollowing});

  factory CheckFollowData.fromJson(Map<String, dynamic> json) {
    return CheckFollowData(isFollowing: json[ApiKey.isFollowing] ?? false);
  }
}
