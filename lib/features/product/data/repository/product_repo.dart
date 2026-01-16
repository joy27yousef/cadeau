import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/features/product/data/models/product_by_id_model.dart';

class ProductRepo {
  final ApiConsumer api;

  ProductRepo({required this.api});

  // Future<CategoriesModel> getCategories() async {
  //   try {
  //     final response = await api.get(AppEndpoint.categories);
  //     final categories = CategoriesModel.fromJson(response);
  //     return categories;
  //   } catch (e) {
  //     throw Exception('Failed to load categories');
  //   }
  // }

  Future<ProductByIdModel> getProductById(String id) async {
    try {
      final response = await api.get('${AppEndpoint.products}/$id');
      final product = ProductByIdModel.fromJson(response);
      return product;
    } catch (e) {
      throw Exception('Failed to load category');
    }
  }
}
