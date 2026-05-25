import 'dart:convert';

class ViewCartModel {
  final bool status;
  final CartData? data;
  final String message;
  final int code;

  ViewCartModel({
    required this.status,
    this.data,
    required this.message,
    required this.code,
  });

  factory ViewCartModel.fromJson(Map<String, dynamic> json) {
    return ViewCartModel(
      status: json['status'] ?? false,
      message: json['meassgae'] ?? json['message'] ?? '',
      code: json['code'] ?? 0,
      data: json['data'] != null ? CartData.fromJson(json['data']) : null,
    );
  }
}

class CartData {
  final Cart cart;
  final List<CartItem> cartItems;

  CartData({required this.cart, required this.cartItems});

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      cart: Cart.fromJson(json['cart'] ?? {}),
      cartItems: (json['cartItems'] as List? ?? [])
          .map((e) => CartItem.fromJson(e))
          .toList(),
    );
  }
}

class Cart {
  final String id;
  final String userId;
  final String itemsCount;
  final String createdAt;
  final String updatedAt;

  Cart({
    required this.id,
    required this.userId,
    required this.itemsCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id']?.toString() ?? '',
      userId: json['user_id']?.toString() ?? '',
      itemsCount: json['items_count']?.toString() ?? '0',
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
    );
  }
}

class CartItem {
  final String cartItemId;
  final String productId;
  final String productNameEnglish;
  final String productNameArabic;
  final String productDescriptionEnglish;
  final String productDescriptionArabic;
  final String productPrice;
  final String quantity;
  final String totalPrice;
  final String variantId;
  final String variantSKU;
  final Map<String, dynamic> variantAttributesEn;
  final Map<String, dynamic> variantAttributesAr;
  final String variantPrice;
  final String productImage;

  CartItem({
    required this.cartItemId,
    required this.productId,
    required this.productNameEnglish,
    required this.productNameArabic,
    required this.productDescriptionEnglish,
    required this.productDescriptionArabic,
    required this.productPrice,
    required this.quantity,
    required this.totalPrice,
    required this.variantId,
    required this.variantSKU,
    required this.variantAttributesEn,
    required this.variantAttributesAr,
    required this.variantPrice,
    required this.productImage,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      cartItemId: json['cartItemId']?.toString() ?? '',
      productId: json['productId']?.toString() ?? '',
      productNameEnglish: json['productNameEnglish'] ?? '',
      productNameArabic: json['productNameArabic'] ?? '',
      productDescriptionEnglish: json['productDescriptionEnglish'] ?? '',
      productDescriptionArabic: json['productDescriptionArabic'] ?? '',
      productPrice: json['productPrice']?.toString() ?? '0.0',
      quantity: json['quantity']?.toString() ?? '1',
      totalPrice: json['totalPrice']?.toString() ?? '0.0',
      variantId: json['variantId']?.toString() ?? '',
      variantSKU: json['variantSKU'] ?? '',
      variantAttributesEn: Map<String, dynamic>.from(
        json['variantAttributesEn'] ?? {},
      ),
      variantAttributesAr: Map<String, dynamic>.from(
        json['variantAttributesAr'] ?? {},
      ),
      variantPrice: json['variantPrice']?.toString() ?? '0.0',
      productImage: json['productImage'] ?? '',
    );
  }
}
