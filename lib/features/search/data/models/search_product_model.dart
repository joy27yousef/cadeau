import 'package:cadeau/core/data/apis/app_endpoint.dart';

class SearchProductModel {
  final bool status;
  final List<ProductDetails> data;
  final int code;

  SearchProductModel({
    required this.status,
    required this.data,
    required this.code,
  });

  factory SearchProductModel.fromJson(Map<String, dynamic> json) {
    return SearchProductModel(
      status: json[ApiKey.status] ?? false,
      data: (json[ApiKey.data] as List? ?? [])
          .map((e) => ProductDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class ProductDetails {
  final String? productId;
  final String? categoryId;
  final String? brandId;

  final String? productNameEnglish;
  final String? productNameArabic;

  final String? productDescriptionEnglish;
  final String? productDescriptionArabic;

  final String? productPriceFrom;
  final String? productImage;

  ProductDetails({
    this.productId,
    this.categoryId,
    this.brandId,
    this.productNameEnglish,
    this.productNameArabic,
    this.productDescriptionEnglish,
    this.productDescriptionArabic,
    this.productPriceFrom,
    this.productImage,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      productId: json[ApiKey.productId]?.toString(),
      categoryId: json[ApiKey.categoryId]?.toString(),
      brandId: json[ApiKey.brandId]?.toString(),
      productNameEnglish: json[ApiKey.productNameEnglish],
      productNameArabic: json[ApiKey.productNameArabic],
      productDescriptionEnglish: json[ApiKey.productDescriptionEnglish],
      productDescriptionArabic: json[ApiKey.productDescriptionArabic],
      productPriceFrom: json[ApiKey.productPriceFrom]?.toString(),
      productImage: json[ApiKey.productImage],
    );
  }
}
