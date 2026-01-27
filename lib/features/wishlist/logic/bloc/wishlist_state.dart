import 'package:cadeau/features/wishlist/data/models/add_remove_wishlist.dart';
import 'package:cadeau/features/wishlist/data/models/my_wishlist_model.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class AddWishlistSuccess extends WishlistState {
  final AddRemoveWishlistModel wishlist;
  AddWishlistSuccess(this.wishlist);
}

class RemoveWishlistSuccess extends WishlistState {
  final AddRemoveWishlistModel wishlist;
  RemoveWishlistSuccess(this.wishlist);
}

class LoadWishlistSuccess extends WishlistState {
  final MyWishlistModel wishlist;
  LoadWishlistSuccess(this.wishlist);
}

class WishlistError extends WishlistState {
  final String message;
  WishlistError(this.message);
}
