import 'package:cadeau/features/brands/data/models/brand_by_id_model.dart';
import 'package:cadeau/features/brands/data/models/brands_model.dart';

abstract class BrandsState {}

class BrandsInitial extends BrandsState {}

class BrandsLoading extends BrandsState {}

class BrandsSuccess extends BrandsState {
  final BrandsModel categories;
  BrandsSuccess(this.categories);
}

class BrandByIdSuccess extends BrandsState {
  final BrandByIdModel brand;
  BrandByIdSuccess(this.brand);
}

class BrandsError extends BrandsState {
  final String message;
  BrandsError(this.message);
}
