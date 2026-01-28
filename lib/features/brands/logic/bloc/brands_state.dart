import 'package:cadeau/features/brands/data/models/brand_by_id_model.dart';
import 'package:cadeau/features/brands/data/models/brands_model.dart';

abstract class BrandsState {}

//brands
class BrandsInitial extends BrandsState {}

class BrandsLoading extends BrandsState {}

class BrandsSuccess extends BrandsState {
  final BrandsModel brand;
  BrandsSuccess(this.brand);
}

class BrandsError extends BrandsState {
  final String message;
  BrandsError(this.message);
}

//brands By id
class BrandByIdSuccess extends BrandsState {
  final BrandByIdModel brand;
  BrandByIdSuccess(this.brand);
}

class BrandsByIdError extends BrandsState {
  final String message;
  BrandsByIdError(this.message);
}

class BrandsByIdInitial extends BrandsState {}

class BrandsByIdLoading extends BrandsState {}
