import 'package:cadeau/features/product/data/models/product_by_id_model.dart';
import 'package:cadeau/features/product/data/repository/product_repo.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/product/logic/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo repo;

  ProductByIdModel? cachedProducts;

  ProductBloc({required this.repo}) : super(ProductInitial()) {
    // on<LoadCategories>(loadCategories);
    on<LoadProductById>(loadProductById);
  }

  // Future<void> loadCategories(
  //   LoadCategories event,
  //   Emitter<CategoriesState> emit,
  // ) async {
  //   emit(CategoriesLoading());
  //   try {
  //     final categories = await repo.getCategories();
  //     cachedCategories = categories;
  //     emit(CategoriesSuccess(categories));
  //   } catch (e) {
  //     emit(CategoriesError(e.toString()));
  //   }
  // }

  Future<void> loadProductById(
    LoadProductById event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final product = await repo.getProductById(event.productId);
      emit(ProductByIdSuccess(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
