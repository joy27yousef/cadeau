part of 'cart_bloc.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

class CartActionSuccess extends CartState {
  final String message;
  CartActionSuccess(this.message);
}

class CartSuccess extends CartState {
  final ViewCartModel cart;

  CartSuccess(this.cart);

  double get totalPrice {
    final items = cart.data?.cartItems ?? [];

    return items.fold(
      0.0,
      (sum, item) =>
          sum + (double.parse(item.productPrice) * double.parse(item.quantity)),
    );
  }

  int get totalItems {
    final items = cart.data?.cartItems ?? [];

    return items.fold(0, (sum, item) => sum + int.parse(item.quantity));
  }
}
