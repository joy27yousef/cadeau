import 'package:cadeau/core/data/apis/app_endpoint.dart';

class OccasionsModel {
  final bool status;
  final List<Occasions> data;
  final int code;

  OccasionsModel({
    required this.status,
    required this.data,
    required this.code,
  });

  factory OccasionsModel.fromJson(Map<String, dynamic> json) {
    return OccasionsModel(
      status: json[ApiKey.status],
      data: (json[ApiKey.data] as List)
          .map((e) => Occasions.fromJson(e))
          .toList(),
      code: json[ApiKey.code],
    );
  }
}

class Occasions {
  final String occasionId;
  final String occasionNameEnglish;
  final String occasionNameArabic;
  final String occasionDescriptionEnglish;
  final String occasionDescriptionArabic;
  final String occasionImage;

  Occasions({
    required this.occasionId,
    required this.occasionNameEnglish,
    required this.occasionNameArabic,
    required this.occasionDescriptionEnglish,
    required this.occasionDescriptionArabic,
    required this.occasionImage,
  });

  factory Occasions.fromJson(Map<String, dynamic> json) {
    return Occasions(
      occasionId: json[ApiKey.occasionId],
      occasionNameEnglish: json[ApiKey.occasionNameEnglish],
      occasionNameArabic: json[ApiKey.occasionNameArabic],
      occasionDescriptionEnglish: json[ApiKey.occasionDescriptionEnglish],
      occasionDescriptionArabic: json[ApiKey.occasionDescriptionArabic],
      occasionImage: json[ApiKey.occasionImage],
    );
  }
}
