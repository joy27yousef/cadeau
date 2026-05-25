import 'package:cadeau/core/constant/app_endpoint.dart';

class ReportModel {
  final bool status;
  final List<dynamic> data;
  final String message;
  final int code;

  ReportModel({
    required this.status,
    required this.data,
    required this.message,
    required this.code,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] ?? [],
      message: json[ApiKey.message] ?? "",
      code: json[ApiKey.code] ?? 0,
    );
  }
}
