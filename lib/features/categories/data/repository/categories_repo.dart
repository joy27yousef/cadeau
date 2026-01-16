import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/features/categories/data/model/categories_model.dart';
import 'package:cadeau/features/categories/data/model/category_by_id_model.dart';

class CategoriesRepo {
  final ApiConsumer api;

  CategoriesRepo({required this.api});

  Future<CategoriesModel> getCategories() async {
    try {
      final response = await api.get(AppEndpoint.categories);
      final categories = CategoriesModel.fromJson(response);
      return categories;
    } catch (e) {
      throw Exception('Failed to load categories');
    }
  }

  Future<CategoryByIdModel> getCategoryById(String id) async {
    try {
      final response = await api.get('${AppEndpoint.categories}/$id');
      final category = CategoryByIdModel.fromJson(response);
      return category;
    } catch (e) {
      throw Exception('Failed to load category');
    }
  }
}
