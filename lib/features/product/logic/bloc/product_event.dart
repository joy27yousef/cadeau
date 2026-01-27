abstract class ProductEvent {}

class LoadAllProduct extends ProductEvent {}

class LoadProductById extends ProductEvent {
  final String productId;
  LoadProductById(this.productId);
}
class LoadLatestProduct extends ProductEvent {


}

class SelectVariantAttribute extends ProductEvent {
  final String attribute;
  final String value;
  final bool isSelected;

  SelectVariantAttribute({
    required this.attribute,
    required this.value,
    required this.isSelected,
  });
}

class SelectAttribute extends ProductEvent {
  final String key;
  final String value;

  SelectAttribute(this.key, this.value);
}
