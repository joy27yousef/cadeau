import 'package:cadeau/core/data/apis/app_endpoint.dart';

class VerificationAccountModel {
  bool? status;
  UserData? data;
  String? message;
  int? code;

  VerificationAccountModel({this.status, this.data, this.message, this.code});

  factory VerificationAccountModel.fromJson(Map<String, dynamic> json) {
    return VerificationAccountModel(
      status: json[ApiKey.status],
      data: json[ApiKey.data] != null
          ? UserData.fromJson(json[ApiKey.data])
          : null,
      message: json[ApiKey.message],
      code: json[ApiKey.code],
    );
  }
}

class UserData {
  String? accessToken;
  List<String>? userAbility;
  int? userId;
  String? userName;
  String? dateOfVerify;

  UserData({
    this.accessToken,
    this.userAbility,
    this.userId,
    this.userName,
    this.dateOfVerify,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      accessToken: json[ApiKey.accessToken],
      userAbility: json[ApiKey.userAbility]?.cast<String>(),
      userId: json[ApiKey.userId],
      userName: json[ApiKey.userName],
      dateOfVerify: json[ApiKey.dateOfVerify],
    );
  }
}
