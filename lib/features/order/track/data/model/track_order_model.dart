import 'package:cadeau/core/constant/app_endpoint.dart';

class TrackOrderModel {
  final bool? status;
  final List<OrderModel>? data;
  final int? code;

  TrackOrderModel({this.status, this.data, this.code});

  factory TrackOrderModel.fromJson(Map<String, dynamic> json) {
    return TrackOrderModel(
      status: json[ApiKey.status],
      code: json[ApiKey.code],
      data: json[ApiKey.data] != null
          ? List<OrderModel>.from(
              json[ApiKey.data].map((e) => OrderModel.fromJson(e)),
            )
          : [],
    );
  }
}

class OrderModel {
  final String? orderNumber;
  final String? shippingName;
  final String? shippingAddress;
  final List<OrderItemModel>? orderItems;
  final String? total;
  final String? orderStatus;
  final String? paymentStatus;
  final String? date;

  OrderModel({
    this.orderNumber,
    this.shippingName,
    this.shippingAddress,
    this.orderItems,
    this.total,
    this.orderStatus,
    this.paymentStatus,
    this.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderNumber: json[ApiKey.orderNumber],
      shippingName: json[ApiKey.shippingName],
      shippingAddress: json[ApiKey.shippingAddress],
      total: json[ApiKey.total],
      orderStatus: json[ApiKey.orderStatus],
      paymentStatus: json[ApiKey.paymentStatus],
      date: json[ApiKey.date],
      orderItems: json[ApiKey.orderItems] != null
          ? List<OrderItemModel>.from(
              json[ApiKey.orderItems].map((e) => OrderItemModel.fromJson(e)),
            )
          : [],
    );
  }
}

class OrderItemModel {
  final String? productId;
  final String? variantId;
  final String? name;
  final String? quantity;
  final int? price;
  final String? total;

  OrderItemModel({
    this.productId,
    this.variantId,
    this.name,
    this.quantity,
    this.price,
    this.total,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      productId: json['product_id'],
      variantId: json['variant_id'],
      name: json[ApiKey.name],
      quantity: json[ApiKey.quantity],
      price: json[ApiKey.price],
      total: json[ApiKey.total],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'variant_id': variantId,
      ApiKey.name: name,
      ApiKey.quantity: quantity,
      ApiKey.price: price,
      ApiKey.total: total,
    };
  }
}
