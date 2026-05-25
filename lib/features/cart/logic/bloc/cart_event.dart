part of 'cart_bloc.dart';

abstract class CartEvent {}

/// view cart
class GetCartEvent extends CartEvent {}

/// add item
class AddToCartEvent extends CartEvent {
  final int productId;
  final int variantId;
  final int quantity;

  AddToCartEvent({
    required this.productId,
    required this.variantId,
    required this.quantity,
  });
}

/// remove item
class RemoveFromCartEvent extends CartEvent {
  final int productId;
  final int variantId;
  final int quantity;

  RemoveFromCartEvent({
    required this.productId,
    required this.variantId,
    required this.quantity,
  });
}