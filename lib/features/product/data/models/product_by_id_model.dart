import 'package:cadeau/core/data/apis/app_endpoint.dart';

class ProductByIdModel {
  final bool status;
  final ProductDetailsData data;
  final String? message;
  final int code;

  ProductByIdModel({
    required this.status,
    required this.data,
    this.message,
    required this.code,
  });

  factory ProductByIdModel.fromJson(Map<String, dynamic> json) {
    return ProductByIdModel(
      status: json[ApiKey.status] ?? false,
      data: ProductDetailsData.fromJson(json[ApiKey.data] ?? {}),
      message: json[ApiKey.message],
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class ProductDetailsData {
  final String productId;
  final String categoryId;
  final String categoryNameEnglish;
  final String categoryNameArabic;
  final String brandId;
  final String brandNameEnglish;
  final String brandNameArabic;
  final String productNameEnglish;
  final String productNameArabic;
  final String productDescriptionEnglish;
  final String productDescriptionArabic;
  final String price;
  final Map<String, dynamic> featuresEnglish;
  final Map<String, dynamic> featuresArabic;
  final List<String> images;
  final List<ProductVariant> variants;
  final List<ProductRating> ratings;

  ProductDetailsData({
    required this.productId,
    required this.categoryId,
    required this.categoryNameEnglish,
    required this.categoryNameArabic,
    required this.brandId,
    required this.brandNameEnglish,
    required this.brandNameArabic,
    required this.productNameEnglish,
    required this.productNameArabic,
    required this.productDescriptionEnglish,
    required this.productDescriptionArabic,
    required this.price,
    required this.featuresEnglish,
    required this.featuresArabic,
    required this.images,
    required this.variants,
    required this.ratings,
  });

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) {
    return ProductDetailsData(
      productId: json[ApiKey.productId]?.toString() ?? '',
      categoryId: json[ApiKey.categoryId]?.toString() ?? '',
      categoryNameEnglish: json[ApiKey.categoryNameEnglish] ?? '',
      categoryNameArabic: json[ApiKey.categoryNameArabic] ?? '',
      brandId: json[ApiKey.brandId]?.toString() ?? '',
      brandNameEnglish: json[ApiKey.brandNameEnglish] ?? '',
      brandNameArabic: json[ApiKey.brandNameArabic] ?? '',
      productNameEnglish: json[ApiKey.productNameEnglish] ?? '',
      productNameArabic: json[ApiKey.productNameArabic] ?? '',
      productDescriptionEnglish: json[ApiKey.productDescriptionEnglish] ?? '',
      productDescriptionArabic: json[ApiKey.productDescriptionArabic] ?? '',
      price: json[ApiKey.price]?.toString() ?? '0',
      featuresEnglish: Map<String, dynamic>.from(json[ApiKey.featuresEnglish] ?? {}),
      featuresArabic: Map<String, dynamic>.from(json[ApiKey.featuresArabic] ?? {}),
      images: (json[ApiKey.images] as List? ?? []).map((e) => e.toString()).toList(),
      variants: (json[ApiKey.variants] as List? ?? [])
          .map((e) => ProductVariant.fromJson(e))
          .toList(),
      ratings: (json[ApiKey.ratings] as List? ?? [])
          .map((e) => ProductRating.fromJson(e))
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

class ProductRating {
  final String ratingId;
  final double rating;
  final String review;
  final String userId;
  final String userName;
  final String createdAt;

  ProductRating({
    required this.ratingId,
    required this.rating,
    required this.review,
    required this.userId,
    required this.userName,
    required this.createdAt,
  });

  factory ProductRating.fromJson(Map<String, dynamic> json) {
    return ProductRating(
      ratingId: json[ApiKey.ratingId]?.toString() ?? '',
      rating: double.tryParse(json[ApiKey.rating]?.toString() ?? '') ?? 0.0,
      review: json[ApiKey.review] ?? '',
      userId: json[ApiKey.userId]?.toString() ?? '',
      userName: json[ApiKey.userName] ?? '',
      createdAt: json[ApiKey.createdAt] ?? '',
    );
  }
}
