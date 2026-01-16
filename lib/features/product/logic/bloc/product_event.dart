abstract class ProductEvent {}

// class LoadCategories extends ProductEvent {}

class LoadProductById extends ProductEvent {
  final String productId;
  LoadProductById(this.productId);
}
