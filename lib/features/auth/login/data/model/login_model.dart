import 'package:cadeau/core/data/apis/app_endpoint.dart';

class LoginModel {
  final bool status;
  final LoginDataModel data;
  final String message;
  final int code;

  LoginModel({
    required this.status,
    required this.data,
    required this.message,
    required this.code,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json[ApiKey.status],
      data: LoginDataModel.fromJson(json[ApiKey.data]),
      message: json[ApiKey.message],
      code: json[ApiKey.code],
    );
  }
}

class LoginDataModel {
  final String accessToken;
  final int userId;
  final String userName;

  LoginDataModel({
    required this.accessToken,
    required this.userId,
    required this.userName,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      accessToken: json[ApiKey.accessToken],
      userId: json[ApiKey.userId],
      userName: json[ApiKey.userName],
    );
  }
}
