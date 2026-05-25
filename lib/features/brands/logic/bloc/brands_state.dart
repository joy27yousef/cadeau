import 'package:cadeau/features/brands/data/models/brand_by_id_model.dart';
import 'package:cadeau/features/brands/data/models/brands_model.dart';

class BrandsState {
  final BrandsModel? brandsModel;
  final BrandByIdModel? brandByIdModel;
  final bool isFollowing;

  final bool isBrandsLoading;
  final bool isBrandByIdLoading;
  final bool isFollowActionLoading;

  final String? brandsErrorMessage;
  final String? brandByIdErrorMessage;
  final String? followActionErrorMessage;
  final String? followSuccessMessage;

  const BrandsState({
    this.brandsModel,
    this.brandByIdModel,
    this.isFollowing = false,
    this.isBrandsLoading = false,
    this.isBrandByIdLoading = false,
    this.isFollowActionLoading = false,
    this.brandsErrorMessage,
    this.brandByIdErrorMessage,
    this.followActionErrorMessage,
    this.followSuccessMessage,
  });

  BrandsState copyWith({
    BrandsModel? brandsModel,
    BrandByIdModel? brandByIdModel,
    bool? isFollowing,
    bool? isBrandsLoading,
    bool? isBrandByIdLoading,
    bool? isFollowActionLoading,
    String? brandsErrorMessage,
    String? brandByIdErrorMessage,
    String? followActionErrorMessage,
    String? followSuccessMessage,
  }) {
    return BrandsState(
      brandsModel: brandsModel ?? this.brandsModel,
      brandByIdModel: brandByIdModel ?? this.brandByIdModel,
      isFollowing: isFollowing ?? this.isFollowing,
      isBrandsLoading: isBrandsLoading ?? this.isBrandsLoading,
      isBrandByIdLoading: isBrandByIdLoading ?? this.isBrandByIdLoading,
      isFollowActionLoading:
          isFollowActionLoading ?? this.isFollowActionLoading,
      brandsErrorMessage: brandsErrorMessage,
      brandByIdErrorMessage: brandByIdErrorMessage,
      followActionErrorMessage: followActionErrorMessage,
      followSuccessMessage: followSuccessMessage,
    );
  }
}
