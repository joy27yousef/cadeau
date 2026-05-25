
import 'package:cadeau/features/latest_product/data/repository/latest_product_repo.dart';
import 'package:cadeau/features/latest_product/logic/bloc/Latest_product_event.dart';
import 'package:cadeau/features/latest_product/logic/bloc/Latest_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestProductBloc extends Bloc<LatestProductEvent, LatestProductState> {
  final LatestProductRepo repo;

  LatestProductBloc({required this.repo}) : super(LatestProductInitial()) {
    on<LoadLatestProduct>(loadLatestProduct);
  }
  Future<void> loadLatestProduct(
    LoadLatestProduct event,
    Emitter<LatestProductState> emit,
  ) async {
    emit(LatestProductLoading());

    final products = await repo.getLatestProduct();

    products.fold(
      (error) {
        emit(LatestProductError(error.message));
      },
      (model) {
        emit(LatestProductSuccess(model));
      },
    );
  }
}
