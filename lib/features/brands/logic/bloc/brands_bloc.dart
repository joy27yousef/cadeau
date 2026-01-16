import 'package:cadeau/features/brands/data/models/brands_model.dart';
import 'package:cadeau/features/brands/data/repository/brands_repo.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final BrandsRepo repo;

  BrandsModel? cachedBrands;

  BrandsBloc({required this.repo}) : super(BrandsInitial()) {
    on<LoadBrands>(loadBrands);
    on<LoadBrandById>(loadBrandById);
  }

  Future<void> loadBrands(LoadBrands event, Emitter<BrandsState> emit) async {
    emit(BrandsLoading());
    try {
      final brands = await repo.getBrands();
      cachedBrands = brands;
      emit(BrandsSuccess(brands));
    } catch (e) {
      emit(BrandsError(e.toString()));
    }
  }

  Future<void> loadBrandById(
    LoadBrandById event,
    Emitter<BrandsState> emit,
  ) async {
    emit(BrandsLoading());
    try {
      final brand = await repo.getBrandsById(event.brandId);
      emit(BrandByIdSuccess(brand));
    } catch (e) {
      emit(BrandsError(e.toString()));
    }
  }
}
