import 'package:cadeau/core/data/apis/app_endpoint.dart';

class RegisterModel {
  final bool status;
  final RegisterDataModel? data;
  final String message;
  final int code;

  RegisterModel({
    required this.status,
    required this.data,
    required this.message,
    required this.code,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] != null
          ? RegisterDataModel.fromJson(json[ApiKey.data])
          : null,
      message: json[ApiKey.message] ?? '',
      code: json[ApiKey.code] ?? 500,
    );
  }
}

class RegisterDataModel {
  final RegisterUserModel? user;

  RegisterDataModel({required this.user});

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) {
    return RegisterDataModel(
      user: json[ApiKey.user] != null
          ? RegisterUserModel.fromJson(json[ApiKey.user])
          : null,
    );
  }
}

class RegisterUserModel {
  final int userId;
  final String userName;
  final String? userGender;
  final String userPhoneNumber;
  final String userEmail;

  RegisterUserModel({
    required this.userId,
    required this.userName,
    required this.userGender,
    required this.userPhoneNumber,
    required this.userEmail,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(
      userId: json[ApiKey.userId] ?? 0,
      userName: json[ApiKey.userName] ?? '',
      userGender: json[ApiKey.userGender],
      userPhoneNumber: json[ApiKey.userPhoneNumber] ?? '',
      userEmail: json[ApiKey.userEmail] ?? '',
    );
  }
}
