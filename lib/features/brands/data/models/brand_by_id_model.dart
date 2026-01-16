import 'package:cadeau/core/data/apis/app_endpoint.dart';

class BrandByIdModel {
  final bool status;
  final BrandDetail data;
  final int code;

  BrandByIdModel({
    required this.status,
    required this.data,
    required this.code,
  });

  factory BrandByIdModel.fromJson(Map<String, dynamic> json) {
    return BrandByIdModel(
      status: json[ApiKey.status] ?? false,
      data: BrandDetail.fromJson(json[ApiKey.data] ?? {}),
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class BrandDetail {
  final Brand brand;
  final List<Product> products;

  BrandDetail({required this.brand, required this.products});

  factory BrandDetail.fromJson(Map<String, dynamic> json) {
    return BrandDetail(
      brand: Brand.fromJson(json[ApiKey.brand] ?? {}),
      products:
          (json[ApiKey.products] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e))
              .toList() ??
          [],
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
