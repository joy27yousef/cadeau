import 'package:cadeau/features/product/data/models/all_product_model.dart';
import 'package:cadeau/features/product/data/models/latest_product_model.dart';
import 'package:cadeau/features/product/data/models/product_by_id_model.dart';
import 'package:cadeau/features/product/data/repository/product_repo.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/product/logic/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo repo;
  AllProductModel? cachedProducts;
  LatestProductModel? cachedLatestProduct;

  ProductBloc({required this.repo}) : super(ProductInitial()) {
    on<LoadAllProduct>(loadAllProduct);
    on<LoadProductById>(loadProductById);
    on<SelectAttribute>(onSelectAttribute);
    on<LoadLatestProduct>(loadLatestProduct);
  }
  Future<void> loadLatestProduct(
    LoadLatestProduct event,
    Emitter<ProductState> emit,
  ) async {
    if (cachedLatestProduct != null) {
      emit(ProductLatestSuccess(cachedLatestProduct!));
      return;
    }

    emit(ProductLoading());

    final products = await repo.getLatestProduct();

    products.fold(
      (error) {
        emit(ProductError(error.message));
      },
      (model) {
        cachedLatestProduct = model;
        emit(ProductLatestSuccess(model));
      },
    );
  }

  Future<void> loadAllProduct(
    LoadAllProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());

    final products = await repo.getAllProducts();

    products.fold(
      (error) {
        emit(ProductError(error.message));
      },
      (model) {
        cachedProducts = model;
        emit(ProductSuccess(model));
      },
    );
  }

  Future<void> loadProductById(
    LoadProductById event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());

    final product = await repo.getProductById(event.productId);

    product.fold(
      (error) {
        emit(ProductError(error.message));
      },
      (model) {
        emit(
          ProductByIdSuccess(
            product: model,
            selectedAttributes: {},
            selectedVariant: null,
          ),
        );
      },
    );
  }

  void onSelectAttribute(SelectAttribute event, Emitter<ProductState> emit) {
    final current = state;
    if (current is ProductByIdSuccess) {
      final updated = Map<String, String>.from(current.selectedAttributes);
      updated[event.key] = event.value;

      final matchedVariant = findMatchingVariant(
        current.product.data.variants,
        updated,
      );

      emit(
        current.copyWith(
          selectedAttributes: updated,
          selectedVariant: matchedVariant,
        ),
      );
    }
  }

  ProductVariant? findMatchingVariant(
    List<ProductVariant> variants,
    Map<String, String> selectedAttributes,
  ) {
    for (final variant in variants) {
      bool match = true;
      for (final entry in selectedAttributes.entries) {
        if (variant.attributes[entry.key]?.toString() != entry.value) {
          match = false;
          break;
        }
      }
      if (match) return variant;
    }
    return null;
  }

  Map<String, Set<String>> extractAttributes(List<ProductVariant> variants) {
    final Map<String, Set<String>> result = {};
    for (final variant in variants) {
      variant.attributes.forEach((key, value) {
        result.putIfAbsent(key, () => <String>{});
        result[key]!.add(value.toString());
      });
    }
    return result;
  }
}
