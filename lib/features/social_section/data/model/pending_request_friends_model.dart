import 'package:cadeau/core/constant/app_endpoint.dart';

class PendingRequestFriendsModel {
  final bool status;
  final List<RequestData> data;
  final String message;
  final int code;

  PendingRequestFriendsModel({
    required this.status,
    required this.data,
    required this.message,
    required this.code,
  });

  factory PendingRequestFriendsModel.fromJson(Map<String, dynamic> json) {
    return PendingRequestFriendsModel(
      status: json[ApiKey.status] ?? false,

      data: json[ApiKey.data] != null
          ? List<RequestData>.from(
              json[ApiKey.data].map((x) => RequestData.fromJson(x)),
            )
          : [],

      message: json[ApiKey.message] ?? '',
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class RequestData {
  final String id;
  final String reqStatus;
  final String senderId;
  final String senderName;
  final String senderEmail;
  final String senderProfilImg;

  RequestData({
    required this.id,
    required this.reqStatus,
    required this.senderId,
    required this.senderName,
    required this.senderEmail,
    required this.senderProfilImg,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) {
    return RequestData(
      id: json[ApiKey.id] ?? '',
      reqStatus:
          json[ApiKey.reqStatus] ?? 'pending', 
      senderId: json[ApiKey.senderId] ?? '',
      senderName: json[ApiKey.senderName] ?? 'No Name',
      senderEmail: json[ApiKey.senderEmail] ?? '',
      senderProfilImg: json[ApiKey.senderName] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reqStatus': reqStatus,
      'senderId': senderId,
      'senderName': senderName,
      'senderEmail': senderEmail,
      'senderProfilImg': senderProfilImg,
    };
  }
}
