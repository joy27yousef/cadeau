import 'package:cadeau/core/constant/app_endpoint.dart';

class SearchForFriendsModel {
  final bool status;
  final List<SearchUserData> data;
  final PaginationData pagination;
  final String message;
  final int code;

  SearchForFriendsModel({
    required this.status,
    required this.data,
    required this.pagination,
    required this.message,
    required this.code,
  });

  factory SearchForFriendsModel.fromJson(Map<String, dynamic> json) {
    return SearchForFriendsModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] != null
          ? List<SearchUserData>.from(
              json[ApiKey.data].map((x) => SearchUserData.fromJson(x)),
            )
          : [],
      pagination: json[ApiKey.pagination] != null
          ? PaginationData.fromJson(json[ApiKey.pagination])
          : PaginationData.empty(),
      message: json[ApiKey.message] ?? '',
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class SearchUserData {
  final String id;
  final String userName;
  final String userEmail;
  final String userProfileImg;
  final bool isFriend;

  SearchUserData({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.userProfileImg,
    required this.isFriend,
  });

  factory SearchUserData.fromJson(Map<String, dynamic> json) {
    return SearchUserData(
      id: json[ApiKey.id] ?? '',
      userName: json[ApiKey.userName] ?? 'No Name',
      userEmail: json[ApiKey.userEmail] ?? '',
      userProfileImg: json[ApiKey.userprofileImg] ?? '',
      isFriend: json[ApiKey.isFriend] ?? false,
    );
  }
}

class PaginationData {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  PaginationData({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory PaginationData.fromJson(Map<String, dynamic> json) {
    return PaginationData(
      currentPage: json[ApiKey.currentPage] ?? 1,
      lastPage: json[ApiKey.lastPage] ?? 1,
      perPage: json[ApiKey.perPage] ?? 10,
      total: json[ApiKey.total] ?? 0,
    );
  }

  factory PaginationData.empty() {
    return PaginationData(currentPage: 1, lastPage: 1, perPage: 10, total: 0);
  }
}
