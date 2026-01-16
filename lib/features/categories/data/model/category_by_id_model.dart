import 'dart:convert';

import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/features/categories/data/model/categories_model.dart';

class CategoryByIdModel {
  final bool status;
  final CategoryDetail data;
  final int code;

  CategoryByIdModel({
    required this.status,
    required this.data,
    required this.code,
  });

  factory CategoryByIdModel.fromJson(Map<String, dynamic> json) {
    return CategoryByIdModel(
      status: json[ApiKey.status] ?? false,
      data: CategoryDetail.fromJson(json[ApiKey.data] ?? {}),
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class CategoryDetail {
  final Category category;
  final List<Category> subcategories;
  final List<Product> products;

  CategoryDetail({
    required this.category,
    required this.subcategories,
    required this.products,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) {
    return CategoryDetail(
      category: Category.fromJson(json[ApiKey.category] ?? {}),
      subcategories:
          (json[ApiKey.subcategories] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e))
              .toList() ??
          [],
      products:
          (json[ApiKey.products] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Product {
  final String productId;
  final String productNameEnglish;
  final String productNameArabic;
  final String productDescriptionEnglish;
  final String productDescriptionArabic;
  final String productPrice;
  final Map<String, dynamic> productFeaturesEnglish;
  final Map<String, dynamic> productFeaturesArabic;
  final String categoryId;
  final String brandId;
  final String productImage;

  Product({
    required this.productId,
    required this.productNameEnglish,
    required this.productNameArabic,
    required this.productDescriptionEnglish,
    required this.productDescriptionArabic,
    required this.productPrice,
    required this.productFeaturesEnglish,
    required this.productFeaturesArabic,
    required this.categoryId,
    required this.brandId,
    required this.productImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json[ApiKey.productId] ?? '',
      productNameEnglish: json[ApiKey.productNameEnglish] ?? '',
      productNameArabic: json[ApiKey.productNameArabic] ?? '',
      productDescriptionEnglish: json[ApiKey.productDescriptionEnglish] ?? '',
      productDescriptionArabic: json[ApiKey.productDescriptionArabic] ?? '',
      productPrice: json[ApiKey.productPrice] ?? '',
      productFeaturesEnglish: Map<String, dynamic>.from(
        json[ApiKey.productFeaturesEnglish] ?? {},
      ),
      productFeaturesArabic: Map<String, dynamic>.from(
        json[ApiKey.productFeaturesArabic] ?? {},
      ),
      categoryId: json[ApiKey.categoryId] ?? '',
      brandId: json[ApiKey.brandId] ?? '',
      productImage: json[ApiKey.productImage] ?? '',
    );
  }
}
