import 'package:cadeau/core/data/apis/request_status%20.dart';
import 'package:cadeau/features/brands/data/repository/brands_repo.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
//   final BrandsRepo repo;

//   BrandsModel? cachedBrands;

//   BrandsBloc({required this.repo}) : super(BrandsInitial()) {
//     on<LoadBrands>(loadBrands);
//     on<LoadBrandById>(loadBrandById);
//   }

//   Future<void> loadBrands(LoadBrands event, Emitter<BrandsState> emit) async {
//     emit(BrandsLoading());

//     final result = await repo.getBrands();

//     result.fold(
//       (error) {
//         emit(BrandsError(error.message));
//       },
//       (model) {
//         cachedBrands = model;
//         emit(BrandsSuccess(model));
//       },
//     );
//   }

//   Future<void> loadBrandById(
//     LoadBrandById event,
//     Emitter<BrandsState> emit,
//   ) async {
//     emit(BrandsLoading());

//     final result = await repo.getBrandsById(event.brandId);

//     result.fold(
//       (error) {
//         emit(BrandsError(error.message));
//       },
//       (model) {
//         emit(BrandByIdSuccess(model));
//       },
//     );
//   }
// }
class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final BrandsRepo repo;

  BrandsBloc({required this.repo}) : super(const BrandsState()) {
    on<LoadBrands>(loadBrands);
    on<LoadBrandById>(loadBrandById);
  }

  Future<void> loadBrands(LoadBrands event, Emitter<BrandsState> emit) async {
    emit(state.copyWith(brandsStatus: RequestStatus.loading));

    final result = await repo.getBrands();

    result.fold(
      (error) => emit(
        state.copyWith(
          brandsStatus: RequestStatus.failure,
          error: error.message,
        ),
      ),
      (model) => emit(
        state.copyWith(brandsStatus: RequestStatus.success, brands: model),
      ),
    );
  }

  Future<void> loadBrandById(
    LoadBrandById event,
    Emitter<BrandsState> emit,
  ) async {
    emit(state.copyWith(brandDetailsStatus: RequestStatus.loading));

    final result = await repo.getBrandsById(event.brandId);

    result.fold(
      (error) => emit(
        state.copyWith(
          brandDetailsStatus: RequestStatus.failure,
          error: error.message,
        ),
      ),
      (model) => emit(
        state.copyWith(
          brandDetailsStatus: RequestStatus.success,
          selectedBrand: model,
        ),
      ),
    );
  }
}
