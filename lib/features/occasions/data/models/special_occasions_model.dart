import 'package:cadeau/core/data/apis/app_endpoint.dart';

class SpecialOccasionsModel {
  final bool status;
  final List<OccasionData> data;

  SpecialOccasionsModel({required this.status, required this.data});

  factory SpecialOccasionsModel.fromJson(Map<String, dynamic> json) {
    return SpecialOccasionsModel(
      status: json[ApiKey.status] ?? false,
      data: (json[ApiKey.data] as List? ?? [])
          .map((e) => OccasionData.fromJson(e))
          .toList(),
    );
  }
}

class OccasionData {
  final String occasionId;
  final String occasionNameEnglish;
  final String occasionNameArabic;
  final String image;

  OccasionData({
    required this.occasionId,
    required this.occasionNameEnglish,
    required this.occasionNameArabic,
    required this.image,
  });

  factory OccasionData.fromJson(Map<String, dynamic> json) {
    return OccasionData(
      occasionId: json[ApiKey.occasionId]?.toString() ?? '',
      occasionNameEnglish: json[ApiKey.occasionNameEnglish] ?? '',
      occasionNameArabic: json[ApiKey.occasionNameArabic] ?? '',
      image: json[ApiKey.image] ?? '',
    );
  }
}
