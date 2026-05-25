

import 'package:cadeau/features/latest_product/data/models/latest_product_model.dart';

abstract class LatestProductState {}

class LatestProductInitial extends LatestProductState {}

class LatestProductLoading extends LatestProductState {}

class LatestProductSuccess extends LatestProductState {
  final LatestProductModel products;
  LatestProductSuccess(this.products);
}

class LatestProductError extends LatestProductState {
  final String message;
  LatestProductError(this.message);
}
