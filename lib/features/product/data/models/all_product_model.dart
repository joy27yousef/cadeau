import 'package:cadeau/core/data/apis/app_endpoint.dart';

class AllProductModel {
  final bool status;
  final List<ProductData> data;
  final String? message;
  final int code;

  AllProductModel({
    required this.status,
    required this.data,
    this.message,
    required this.code,
  });

  factory AllProductModel.fromJson(Map<String, dynamic> json) {
    return AllProductModel(
      status: json[ApiKey.status] ?? false,
      data: (json[ApiKey.data] as List? ?? [])
          .map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json[ApiKey.message],
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class ProductData {
  final String productId;
  final String vendorId;
  final String? vendorLogo;
  final String vendorShopNameArabic;
  final String vendorShopNameEnglish;

  final String categoryId;
  final String categoryNameEnglish;
  final String categoryNameArabic;

  final String brandId;
  final String brandNameEnglish;
  final String brandNameArabic;

  final String productNameEnglish;
  final String productNameArabic;
  final String productPrice;
  final String productImage;
  final int productRating;

  ProductData({
    required this.productId,
    required this.vendorId,
    this.vendorLogo,
    required this.vendorShopNameArabic,
    required this.vendorShopNameEnglish,
    required this.categoryId,
    required this.categoryNameEnglish,
    required this.categoryNameArabic,
    required this.brandId,
    required this.brandNameEnglish,
    required this.brandNameArabic,
    required this.productNameEnglish,
    required this.productNameArabic,
    required this.productPrice,
    required this.productImage,
    required this.productRating,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      productId: json[ApiKey.productId]?.toString() ?? '',
      vendorId: json[ApiKey.vendorId]?.toString() ?? '',
      vendorLogo: json[ApiKey.vendorLogo],
      vendorShopNameArabic: json[ApiKey.vendorShopNameArabic] ?? '',
      vendorShopNameEnglish: json[ApiKey.vendorShopNameEnglish] ?? '',
      categoryId: json[ApiKey.categoryId]?.toString() ?? '',
      categoryNameEnglish: json[ApiKey.categoryNameEnglish] ?? '',
      categoryNameArabic: json[ApiKey.categoryNameArabic] ?? '',
      brandId: json[ApiKey.brandId]?.toString() ?? '',
      brandNameEnglish: json[ApiKey.brandNameEnglish] ?? '',
      brandNameArabic: json[ApiKey.brandNameArabic] ?? '',
      productNameEnglish: json[ApiKey.productNameEnglish] ?? '',
      productNameArabic: json[ApiKey.productNameArabic] ?? '',
      productPrice: json[ApiKey.productPrice]?.toString() ?? '0',
      productImage: json[ApiKey.productImage] ?? '',
      productRating: json[ApiKey.productRating] ?? 0,
    );
  }
}
