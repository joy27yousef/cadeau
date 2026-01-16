import 'package:cadeau/features/product/data/models/product_by_id_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

// class ProductSuccess extends ProductState {
//   final ProductModel categories;
//   CategoriesSuccess(this.categories);
// }

class ProductByIdSuccess extends ProductState {
  final ProductByIdModel product;
  ProductByIdSuccess(this.product);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
