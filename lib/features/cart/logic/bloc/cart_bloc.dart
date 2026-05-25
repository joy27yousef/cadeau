import 'package:cadeau/features/cart/data/repository/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cadeau/features/cart/data/model/view_cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo repo;

  CartBloc({required this.repo}) : super(CartInitial()) {
    on<GetCartEvent>(getCart);
    on<AddToCartEvent>(addToCart);
    on<RemoveFromCartEvent>(removeFromCart);
  }

  ///  Load Cart
  Future<void> getCart(GetCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());

    final result = await repo.getCartResponse();

    result.fold(
      (error) => emit(CartError(error.message)),
      (cart) => emit(CartSuccess(cart)),
    );
  }

  ///  Add To Cart
  Future<void> addToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());

    final result = await repo.addToCardResponse(
      event.productId,
      event.variantId,
      event.quantity,
    );

    result.fold((error) => emit(CartError(error.message)), (response) {
      emit(CartActionSuccess(response.message));
      add(GetCartEvent());
    });
  }

  ///  Remove From Cart
  Future<void> removeFromCart(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());

    final result = await repo.removeFromCartResponse(
      event.productId,
      event.variantId,
      event.quantity,
    );

    result.fold((error) => emit(CartError(error.message)), (response) {
      emit(CartActionSuccess(response.message));
      add(GetCartEvent());
    });
  }

  
}
