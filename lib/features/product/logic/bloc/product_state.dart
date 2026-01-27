import 'package:cadeau/features/product/data/models/all_product_model.dart';
import 'package:cadeau/features/product/data/models/latest_product_model.dart';
import 'package:cadeau/features/product/data/models/product_by_id_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final AllProductModel products;
  ProductSuccess(this.products);
}

class ProductLatestSuccess extends ProductState {
  final LatestProductModel products;
  ProductLatestSuccess(this.products);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

class ProductByIdSuccess extends ProductState {
  final ProductByIdModel product;
  final Map<String, String> selectedAttributes;
  final ProductVariant? selectedVariant;

  ProductByIdSuccess({
    required this.product,
    this.selectedAttributes = const {},
    this.selectedVariant,
  });

  ProductByIdSuccess copyWith({
    Map<String, String>? selectedAttributes,
    ProductVariant? selectedVariant,
  }) {
    return ProductByIdSuccess(
      product: product,
      selectedAttributes: selectedAttributes ?? this.selectedAttributes,
      selectedVariant: selectedVariant,
    );
  }
}
