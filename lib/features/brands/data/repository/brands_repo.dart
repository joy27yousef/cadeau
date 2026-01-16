import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/features/brands/data/models/brand_by_id_model.dart';
import 'package:cadeau/features/brands/data/models/brands_model.dart';

class BrandsRepo {
  final ApiConsumer api;

  BrandsRepo({required this.api});

  Future<BrandsModel> getBrands() async {
    try {
      final response = await api.get(AppEndpoint.brands);
      final brands = BrandsModel.fromJson(response);
      return brands;
    } catch (e) {
      throw Exception('Failed to load brands');
    }
  }

  Future<BrandByIdModel> getBrandsById(String id) async {
    try {
      final response = await api.get('${AppEndpoint.brands}/$id');
      final brand = BrandByIdModel.fromJson(response);
      return brand;
    } catch (e) {
      throw Exception('Failed to load brand');
    }
  }
}
