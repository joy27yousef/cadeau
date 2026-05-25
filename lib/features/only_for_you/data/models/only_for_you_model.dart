import 'package:cadeau/core/constant/app_endpoint.dart';

class OnlyForYouModel {
  final bool? status;
  final List<Product>? data;
  final int? code;

  OnlyForYouModel({this.status, this.data, this.code});

  factory OnlyForYouModel.fromJson(Map<String, dynamic> json) {
    return OnlyForYouModel(
      status: json[ApiKey.status],
      data: json[ApiKey.data] != null
          ? (json[ApiKey.data] as List).map((i) => Product.fromJson(i)).toList()
          : null,
      code: json[ApiKey.code],
    );
  }
}

class Product {
  final String? productId;
  final String? nameEn;
  final String? nameAr;
  final String? price;
  final String? image;

  Product({this.productId, this.nameEn, this.nameAr, this.price, this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json[ApiKey.productId],
      nameEn: json[ApiKey.nameEn],
      nameAr: json[ApiKey.nameAr],
      price: json[ApiKey.price],
      image: json[ApiKey.image],
    );
  }
}
