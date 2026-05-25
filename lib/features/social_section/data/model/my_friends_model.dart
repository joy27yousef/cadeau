import 'package:cadeau/core/constant/app_endpoint.dart';

class MyFriendsModel {
  final bool status;
  final List<UserData> data;
  final String message;
  final int code;

  MyFriendsModel({
    required this.status,
    required this.data,
    required this.message,
    required this.code,
  });

  factory MyFriendsModel.fromJson(Map<String, dynamic> json) {
    return MyFriendsModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] != null
          ? List<UserData>.from(
              json[ApiKey.data].map((x) => UserData.fromJson(x)),
            )
          : [],
      message: json[ApiKey.message] ?? '',
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class UserData {
  final String id;
  final String userName;
  final String userEmail;
  final String userImg;
  final String userBirthDate;

  UserData({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.userImg,
    required this.userBirthDate,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json[ApiKey.id] ?? '',
      userName: json[ApiKey.userName] ?? 'No Name',
      userEmail: json[ApiKey.userEmail] ?? '',
      userImg: json[ApiKey.userImg] ?? '',
      userBirthDate: json[ApiKey.userBirthDate] ?? '',
    );
  }
}
