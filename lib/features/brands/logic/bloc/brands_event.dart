abstract class BrandsEvent {}

class LoadBrands extends BrandsEvent {}

class ToggleFollowBrandEvent extends BrandsEvent {
  final String brandId;
  ToggleFollowBrandEvent(this.brandId);
}

class LoadBrandById extends BrandsEvent {
  final String brandId;
  final String? userToken;

  LoadBrandById(this.brandId, this.userToken);
}
