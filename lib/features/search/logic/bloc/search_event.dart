abstract class SearchEvent {}

class FilterProducts extends SearchEvent {
  final String? categoryId;
  final String? brandId;
  final String? occasionId;
  final String? minPrice;
  final String? maxPrice;
  final String? color;
  final String? storage;
  final String? name;
  final String? size;

  FilterProducts({
    this.categoryId,
    this.brandId,
    this.occasionId,
    this.minPrice,
    this.maxPrice,
    this.color,
    this.storage,
    this.name,
    this.size,
  });
}
