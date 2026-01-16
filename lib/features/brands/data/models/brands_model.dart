import 'package:cadeau/core/data/apis/app_endpoint.dart';

class BrandsModel {
  final bool status;
  final int code;
  final List<Brand> data;

  BrandsModel({required this.status, required this.code, required this.data});

  factory BrandsModel.fromJson(Map<String, dynamic> json) {
    return BrandsModel(
      status: json[ApiKey.status] ?? false,
      code: json[ApiKey.code] ?? 0,
      data: (json[ApiKey.data] as List).map((e) => Brand.fromJson(e)).toList(),
    );
  }
}

class Brand {
  final String brandId;
  final String brandNameEnglish;
  final String brandNameArabic;
  final String brandDescriptionEnglish;
  final String brandDescriptionArabic;
  final String brandLogo;

  Brand({
    required this.brandId,
    required this.brandNameEnglish,
    required this.brandNameArabic,
    required this.brandDescriptionEnglish,
    required this.brandDescriptionArabic,
    required this.brandLogo,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      brandId: json[ApiKey.brandId] ?? '',
      brandNameEnglish: json[ApiKey.brandNameEnglish] ?? '',
      brandNameArabic: json[ApiKey.brandNameArabic] ?? '',
      brandDescriptionEnglish: json[ApiKey.brandDescriptionEnglish] ?? '',
      brandDescriptionArabic: json[ApiKey.brandDescriptionArabic] ?? '',
      brandLogo: json[ApiKey.brandLogo] ?? '',
    );
  }
}
