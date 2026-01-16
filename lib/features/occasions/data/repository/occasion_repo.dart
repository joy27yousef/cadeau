import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/features/occasions/data/models/occasion_by_id_model.dart';
import 'package:cadeau/features/occasions/data/models/occasions_model.dart';

class OccasionRepo {
  final ApiConsumer api;

  OccasionRepo({required this.api});

  Future<OccasionsModel> getOccasions() async {
    try {
      final response = await api.get(AppEndpoint.occasions);
      final occasions = OccasionsModel.fromJson(response);
      return occasions;
    } catch (e) {
      throw Exception('Failed to load categories');
    }
  }

  Future<OccasionByIdModel> getOccasionById(String id) async {
    try {
      final response = await api.get('${AppEndpoint.occasions}/$id');
      final occasion = OccasionByIdModel.fromJson(response);
      return occasion;
    } catch (e) {
      throw Exception('Failed to load occasions');
    }
  }
}
