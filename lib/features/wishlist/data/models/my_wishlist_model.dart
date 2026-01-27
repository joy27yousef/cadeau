import 'package:cadeau/core/data/apis/app_endpoint.dart';

class MyWishlistModel {
  final bool status;
  final WishlistData? data;
  final String meassgae;
  final int code;

  MyWishlistModel({
    required this.status,
    this.data,
    required this.meassgae,
    required this.code,
  });

  factory MyWishlistModel.fromJson(Map<String, dynamic> json) {
    return MyWishlistModel(
      status: json[ApiKey.status] == true,
      data: json[ApiKey.data] != null
          ? WishlistData.fromJson(json[ApiKey.data])
          : null,
      meassgae: json['meassgae'] ?? '',
      code: json[ApiKey.code] ?? 0,
    );
  }
}

class WishlistData {
  final Wishlist wishlist;
  final List<WishlistItem> wishlistItems;

  WishlistData({required this.wishlist, required this.wishlistItems});

  factory WishlistData.fromJson(Map<String, dynamic> json) {
    return WishlistData(
      wishlist: Wishlist.fromJson(json[ApiKey.wishlist] ?? {}),
      wishlistItems: (json[ApiKey.wishlistItems] as List? ?? [])
          .map((e) => WishlistItem.fromJson(e))
          .toList(),
    );
  }
}

class Wishlist {
  final String id;
  final String userId;
  final String itemsCount;
  final String createdAt;
  final String updatedAt;

  Wishlist({
    required this.id,
    required this.userId,
    required this.itemsCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) {
    return Wishlist(
      id: json[ApiKey.id]?.toString() ?? '',
      userId: json[ApiKey.userId]?.toString() ?? '',
      itemsCount: json[ApiKey.itemsCount]?.toString() ?? '0',
      createdAt: json[ApiKey.createdAt] ?? '',
      updatedAt: json[ApiKey.updatedAt] ?? '',
    );
  }
}

class WishlistItem {
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final String price;
  final String productImage;

  WishlistItem({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.price,
    required this.productImage,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: json[ApiKey.id]?.toString() ?? '',
      nameEn: json[ApiKey.nameen] ?? '',
      nameAr: json[ApiKey.namear] ?? '',
      descriptionEn: json[ApiKey.descriptionen] ?? '',
      descriptionAr: json[ApiKey.descriptionar] ?? '',
      price: json[ApiKey.price]?.toString() ?? '0',
      productImage: json[ApiKey.productImage] ?? '',
    );
  }
}
