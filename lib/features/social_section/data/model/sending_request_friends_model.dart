import 'package:cadeau/core/constant/app_endpoint.dart';

class SendingRequestFriendsModel {
  final bool status;
  final List<ReceiverData> data;
  final String message;
  final int code;

  SendingRequestFriendsModel({
    required this.status,
    required this.data,
    required this.message,
    required this.code,
  });

  factory SendingRequestFriendsModel.fromJson(Map<String, dynamic> json) {
    return SendingRequestFriendsModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] != null
          ? List<ReceiverData>.from(
              json[ApiKey.data].map((x) => ReceiverData.fromJson(x)),
            )
          : [],
      message: json[ApiKey.message] ?? '',
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class ReceiverData {
  final String id;
  final String reqStatus;
  final String receiverId;
  final String receiverName;
  final String receiverEmail;
  final String receiverProfilImg;

  ReceiverData({
    required this.id,
    required this.reqStatus,
    required this.receiverId,
    required this.receiverName,
    required this.receiverEmail,
    required this.receiverProfilImg,
  });

  factory ReceiverData.fromJson(Map<String, dynamic> json) {
    return ReceiverData(
      id: json[ApiKey.id] ?? '',
      reqStatus: json[ApiKey.reqStatus] ?? 'pending',
      receiverId: json[ApiKey.receiverId] ?? '',
      receiverName: json[ApiKey.receiverName] ?? 'No Name',
      receiverEmail: json[ApiKey.receiverEmail] ?? '',
      receiverProfilImg: json[ApiKey.receiverProfilImg] ?? '',
    );
  }
}
