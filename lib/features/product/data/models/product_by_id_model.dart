import 'package:cadeau/core/data/apis/app_endpoint.dart';

class ProductByIdModel {
  final bool status;
  final ProductData? data;
  final String? message;
  final int code;

  ProductByIdModel({
    required this.status,
    required this.data,
    required this.message,
    required this.code,
  });

  factory ProductByIdModel.fromJson(Map<String, dynamic> json) {
    return ProductByIdModel(
      status: json[ApiKey.status] ?? false,
      data: json[ApiKey.data] != null
          ? ProductData.fromJson(json[ApiKey.data])
          : null,
      message: json[ApiKey.message],
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class ProductData {
  final String productId;
  final String categoryId;
  final String brandId;
  final String productNameEnglish;
  final String productNameArabic;
  final String productDescriptionEnglish;
  final String productDescriptionArabic;
  final String price;

  final Map<String, dynamic> featuresEnglish;
  final Map<String, dynamic> featuresArabic;

  final List<String> images;
  final List<ProductVariant> variants;

  ProductData({
    required this.productId,
    required this.categoryId,
    required this.brandId,
    required this.productNameEnglish,
    required this.productNameArabic,
    required this.productDescriptionEnglish,
    required this.productDescriptionArabic,
    required this.price,
    required this.featuresEnglish,
    required this.featuresArabic,
    required this.images,
    required this.variants,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      productId: json[ApiKey.productId]?.toString() ?? '',
      categoryId: json[ApiKey.categoryId]?.toString() ?? '',
      brandId: json[ApiKey.brandId]?.toString() ?? '',
      productNameEnglish: json[ApiKey.productNameEnglish] ?? '',
      productNameArabic: json[ApiKey.productNameArabic] ?? '',
      productDescriptionEnglish: json[ApiKey.productDescriptionEnglish] ?? '',
      productDescriptionArabic: json[ApiKey.productDescriptionArabic] ?? '',
      price: json[ApiKey.price]?.toString() ?? '0',

      featuresEnglish: Map<String, dynamic>.from(
        json[ApiKey.featuresEnglish] ?? {},
      ),
      featuresArabic: Map<String, dynamic>.from(
        json[ApiKey.featuresArabic] ?? {},
      ),

      images: List<String>.from(json[ApiKey.images] ?? []),

      variants: (json[ApiKey.variants] as List? ?? [])
          .map((e) => ProductVariant.fromJson(e))
          .toList(),
    );
  }
}

class ProductVariant {
  final String variantId;
  final String variantSku;
  final String variantPrice;
  final String stockQuantity;
  final bool inStock;
  final Map<String, dynamic> attributes;

  ProductVariant({
    required this.variantId,
    required this.variantSku,
    required this.variantPrice,
    required this.stockQuantity,
    required this.inStock,
    required this.attributes,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      variantId: json[ApiKey.variantId]?.toString() ?? '',
      variantSku: json[ApiKey.variantSku] ?? '',
      variantPrice: json[ApiKey.variantPrice]?.toString() ?? '0',
      stockQuantity: json[ApiKey.stockQuantity]?.toString() ?? '0',
      inStock: json[ApiKey.inStock] ?? false,
      attributes: Map<String, dynamic>.from(json[ApiKey.attributes] ?? {}),
    );
  }
}
