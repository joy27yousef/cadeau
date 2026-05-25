import 'package:cadeau/core/cache/cacheHelper.dart';
import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/features/brands/data/repository/brands_repo.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final BrandsRepo repo;

  BrandsBloc({required this.repo}) : super(const BrandsState()) {
    on<LoadBrands>(loadBrands);
    on<LoadBrandById>(loadBrandById);
    on<ToggleFollowBrandEvent>(toggleFollowBrand);
  }

  Future<void> loadBrands(LoadBrands event, Emitter<BrandsState> emit) async {
    emit(state.copyWith(isBrandsLoading: true, brandsErrorMessage: null));

    final result = await repo.getBrands();

    result.fold(
      (error) => emit(
        state.copyWith(
          isBrandsLoading: false,
          brandsErrorMessage: error.message,
        ),
      ),
      (model) =>
          emit(state.copyWith(isBrandsLoading: false, brandsModel: model)),
    );
  }

  Future<void> loadBrandById(
    LoadBrandById event,
    Emitter<BrandsState> emit,
  ) async {
    emit(state.copyWith(isBrandByIdLoading: true, brandByIdErrorMessage: null));

    final brandResult = await repo.getBrandsById(event.brandId);

    await brandResult.fold(
      (error) async {
        emit(
          state.copyWith(
            isBrandByIdLoading: false,
            brandByIdErrorMessage: error.message,
          ),
        );
      },
      (brandModel) async {
        if (CacheHelper.sharedPreferences.containsKey(GeneralKey.token) &&
            event.userToken != null &&
            event.userToken!.isNotEmpty) {
          final followStatusResult = await repo.getIsFollowBrand(event.brandId);

          followStatusResult.fold(
            (error) {
              emit(
                state.copyWith(
                  isBrandByIdLoading: false,
                  brandByIdModel: brandModel,
                  isFollowing: false,
                ),
              );
            },
            (followStatusModel) {
              emit(
                state.copyWith(
                  isBrandByIdLoading: false,
                  brandByIdModel: brandModel,
                  isFollowing: followStatusModel.data?.isFollowing ?? false,
                ),
              );
            },
          );
        } else {
          emit(
            state.copyWith(
              isBrandByIdLoading: false,
              brandByIdModel: brandModel,
              isFollowing: false,
            ),
          );
        }
      },
    );
  }

  Future<void> toggleFollowBrand(
    ToggleFollowBrandEvent event,
    Emitter<BrandsState> emit,
  ) async {
    emit(
      state.copyWith(
        isFollowActionLoading: true,
        followActionErrorMessage: null,
        followSuccessMessage: null,
      ),
    );

    final result = state.isFollowing
        ? await repo.unFollowBrand(event.brandId)
        : await repo.followBrand(event.brandId);

    result.fold(
      (error) => emit(
        state.copyWith(
          isFollowActionLoading: false,
          followActionErrorMessage: error.message,
        ),
      ),
      (actionModel) {
        emit(
          state.copyWith(
            isFollowActionLoading: false,
            followSuccessMessage: actionModel.message,
            isFollowing: !state.isFollowing,
          ),
        );
      },
    );
  }
}
