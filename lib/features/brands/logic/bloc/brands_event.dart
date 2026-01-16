abstract class BrandsEvent {}

class LoadBrands extends BrandsEvent {}

class LoadBrandById extends BrandsEvent {
  final String brandId;

  LoadBrandById(this.brandId);
}
