import 'package:cadeau/core/data/apis/app_endpoint.dart';

class CategoriesModel {
  final bool status;
  final List<Category> data;
  final int code;

  CategoriesModel({
    required this.status,
    required this.data,
    required this.code,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json[ApiKey.status],
      data: (json[ApiKey.data] as List)
          .map((e) => Category.fromJson(e))
          .toList(),
      code: json[ApiKey.code],
    );
  }
}

class Category {
  final String categoryId;
  final String categoryNameEnglish;
  final String categoryNameArabic;
  final String categoryDescriptionEnglish;
  final String categoryDescriptionArabic;
  final String categoryImage;

  Category({
    required this.categoryId,
    required this.categoryNameEnglish,
    required this.categoryNameArabic,
    required this.categoryDescriptionEnglish,
    required this.categoryDescriptionArabic,
    required this.categoryImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json[ApiKey.categoryId],
      categoryNameEnglish: json[ApiKey.categoryNameEnglish],
      categoryNameArabic: json[ApiKey.categoryNameArabic],
      categoryDescriptionEnglish: json[ApiKey.categoryDescriptionEnglish],
      categoryDescriptionArabic: json[ApiKey.categoryDescriptionArabic],
      categoryImage: json[ApiKey.categoryImage],
    );
  }
}
