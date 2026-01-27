import 'package:cadeau/features/wishlist/data/models/my_wishlist_model.dart';
import 'package:cadeau/features/wishlist/data/repository/wishlist_repo.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_event.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepo repo;

  MyWishlistModel? cachedWishlist;

  WishlistBloc({required this.repo}) : super(WishlistInitial()) {
    on<LoadWishlist>(loadWishlist);
    on<AddWishlistEvent>(addWishlist);
    on<RemoveWishlistEvent>(removeWishlist);
  }

  Future<void> loadWishlist(
    LoadWishlist event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistLoading());

    final result = await repo.getMyWishlist();

    result.fold(
      (error) {
        emit(WishlistError(error.message));
      },
      (wishlist) {
        cachedWishlist = wishlist;
        emit(LoadWishlistSuccess(wishlist));
      },
    );
  }

  Future<void> addWishlist(
    AddWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistLoading());

    final result = await repo.addToWishlist(event.productId);

    result.fold(
      (error) {
        emit(WishlistError(error.message));
      },
      (wishlist) {
        add(LoadWishlist());
        emit(AddWishlistSuccess(wishlist));
      },
    );
  }

  Future<void> removeWishlist(
    RemoveWishlistEvent event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistLoading());

    final result = await repo.removeFromWishlist(event.productId);

    result.fold(
      (error) {
        emit(WishlistError(error.message));
      },
      (wishlist) {
        cachedWishlist?.data?.wishlistItems.removeWhere(
          (e) => e.id == event.productId,
        );

        emit(RemoveWishlistSuccess(wishlist));
      },
    );
  }
}
