import 'package:cadeau/core/data/apis/app_endpoint.dart';

class OccasionByIdModel {
  final bool status;
  final OccasionDetail data;
  final int code;

  OccasionByIdModel({
    required this.status,
    required this.data,
    required this.code,
  });

  factory OccasionByIdModel.fromJson(Map<String, dynamic> json) {
    return OccasionByIdModel(
      status: json[ApiKey.status] ?? false,
      data: OccasionDetail.fromJson(json[ApiKey.data] ?? {}),
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class OccasionDetail {
  final Occasion occasion;
  final List<Product> products;

  OccasionDetail({required this.occasion, required this.products});

  factory OccasionDetail.fromJson(Map<String, dynamic> json) {
    return OccasionDetail(
      occasion: Occasion.fromJson(json[ApiKey.occasion] ?? {}),
      products:
          (json[ApiKey.products] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Occasion {
  final String occasionId;
  final String occasionNameEnglish;
  final String occasionNameArabic;
  final String occasionDescriptionEnglish;
  final String occasionDescriptionArabic;
  final String occasionImage;

  Occasion({
    required this.occasionId,
    required this.occasionNameEnglish,
    required this.occasionNameArabic,
    required this.occasionDescriptionEnglish,
    required this.occasionDescriptionArabic,
    required this.occasionImage,
  });

  factory Occasion.fromJson(Map<String, dynamic> json) {
    return Occasion(
      occasionId: json[ApiKey.occasionId] ?? '',
      occasionNameEnglish: json[ApiKey.occasionNameEnglish] ?? '',
      occasionNameArabic: json[ApiKey.occasionNameArabic] ?? '',
      occasionDescriptionEnglish: json[ApiKey.occasionDescriptionEnglish] ?? '',
      occasionDescriptionArabic: json[ApiKey.occasionDescriptionArabic] ?? '',
      occasionImage: json[ApiKey.occasionImage] ?? '',
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
      productImage: json[ApiKey.productImage] ?? '',
    );
  }
}
