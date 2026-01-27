
abstract class WishlistEvent {}

class LoadWishlist extends WishlistEvent {}

class AddWishlistEvent extends WishlistEvent {
  final String productId;

  AddWishlistEvent(this.productId);
}

class RemoveWishlistEvent extends WishlistEvent {
  final String productId;

  RemoveWishlistEvent(this.productId);
}
