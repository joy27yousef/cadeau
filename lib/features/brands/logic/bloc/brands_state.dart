// import 'package:cadeau/features/brands/data/models/brand_by_id_model.dart';
// import 'package:cadeau/features/brands/data/models/brands_model.dart';

// abstract class BrandsState {}

// class BrandsInitial extends BrandsState {}

// class BrandsLoading extends BrandsState {}

// class BrandsSuccess extends BrandsState {
//   final BrandsModel categories;
//   BrandsSuccess(this.categories);
// }

// class BrandByIdSuccess extends BrandsState {
//   final BrandByIdModel brand;
//   BrandByIdSuccess(this.brand);
// }

// class BrandsError extends BrandsState {
//   final String message;
//   BrandsError(this.message);
// }

import 'package:cadeau/core/data/apis/request_status%20.dart';
import 'package:cadeau/features/brands/data/models/brand_by_id_model.dart';
import 'package:cadeau/features/brands/data/models/brands_model.dart';

class BrandsState {
  final BrandsModel? brands;
  final BrandByIdModel? selectedBrand;

  final RequestStatus brandsStatus;
  final RequestStatus brandDetailsStatus;

  final String? error;

  const BrandsState({
    this.brands,
    this.selectedBrand,
    this.brandsStatus = RequestStatus.initial,
    this.brandDetailsStatus = RequestStatus.initial,
    this.error,
  });

  BrandsState copyWith({
    BrandsModel? brands,
    BrandByIdModel? selectedBrand,
    RequestStatus? brandsStatus,
    RequestStatus? brandDetailsStatus,
    String? error,
  }) {
    return BrandsState(
      brands: brands ?? this.brands,
      selectedBrand: selectedBrand ?? this.selectedBrand,
      brandsStatus: brandsStatus ?? this.brandsStatus,
      brandDetailsStatus: brandDetailsStatus ?? this.brandDetailsStatus,
      error: error,
    );
  }
}
