import 'package:cadeau/features/product/data/models/product_by_id_model.dart';

Map<String, Set<String>> extractFilters(List<ProductVariant> variants) {
  final Map<String, Set<String>> filters = {};

  for (final variant in variants) {
    variant.attributes.forEach((key, value) {
      filters.putIfAbsent(key, () => <String>{});
      filters[key]!.add(value.toString());
    });
  }

  return filters;
}
