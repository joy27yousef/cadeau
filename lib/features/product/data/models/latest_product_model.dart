import 'package:cadeau/core/data/apis/app_endpoint.dart';

class LatestProductModel {
  final bool status;
  final List<ProductItem> data;
  final String message;
  final int code;

  LatestProductModel({
    required this.status,
    required this.data,
    required this.message,
    required this.code,
  });

  factory LatestProductModel.fromJson(Map<String, dynamic> json) {
    return LatestProductModel(
      status: json[ApiKey.status] == true,
      data: (json[ApiKey.data] as List? ?? [])
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json[ApiKey.message] ?? json['messgae'] ?? '',
      code: json[ApiKey.code] ?? 0,
    );
  }

}

class ProductItem {
  final String productId;
  final String productNameEnglish;
  final String productNameArabic;
  final String categoryId;
  final String categoryNameEnglish;
  final String categoryNameArabic;
  final String brandId;
  final String brandNameEnglish;
  final String brandNameArabic;
  final String productPrice;
  final String productImage;

  ProductItem({
    required this.productId,
    required this.productNameEnglish,
    required this.productNameArabic,
    required this.categoryId,
    required this.categoryNameEnglish,
    required this.categoryNameArabic,
    required this.brandId,
    required this.brandNameEnglish,
    required this.brandNameArabic,
    required this.productPrice,
    required this.productImage,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      productId: json[ApiKey.productId]?.toString() ?? '',
      productNameEnglish: json[ApiKey.productNameEnglish] ?? '',
      productNameArabic: json[ApiKey.productNameArabic] ?? '',
      categoryId: json[ApiKey.categoryId]?.toString() ?? '',
      categoryNameEnglish: json[ApiKey.categoryNameEnglish] ?? '',
      categoryNameArabic: json[ApiKey.categoryNameArabic] ?? '',
      brandId: json[ApiKey.brandId]?.toString() ?? '',
      brandNameEnglish: json[ApiKey.brandNameEnglish] ?? '',
      brandNameArabic: json[ApiKey.brandNameArabic] ?? '',
      productPrice: json[ApiKey.productPrice]?.toString() ?? '0',
      productImage: json[ApiKey.productImage] ?? '',
    );
  }

}
