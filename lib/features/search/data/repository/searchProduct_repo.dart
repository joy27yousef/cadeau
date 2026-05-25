import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/search/data/models/search_product_model.dart';
import 'package:dartz/dartz.dart';

class SearchproductRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  SearchproductRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, SearchProductModel>> getFilteredProducts({
    String? categoryId,
    String? occasionId,
    String? brandId,
    double? maxPrice,
    double? minPrice,
    String? name,
    String? color,
    String? storage,
    String? size,
  }) async {
    if (await networkInfo.isConnected) {
      final Map<String, dynamic> params = {};
      if (categoryId != null && categoryId.isNotEmpty) {
        params[ApiKey.categoryId] = categoryId;
      }
      if (brandId != null && brandId.isNotEmpty)
        params[ApiKey.brandId] = brandId;
      if (occasionId != null && occasionId.isNotEmpty) {
        params[ApiKey.occasionId] = occasionId;
      }
      if (maxPrice != null) params[ApiKey.maxPrice] = maxPrice;
      if (minPrice != null) params[ApiKey.minPrice] = minPrice;
      if (name != null && name.isNotEmpty) params[ApiKey.name] = name;
      if (color != null && color.isNotEmpty) params[ApiKey.color] = color;

      if (storage != null && storage.isNotEmpty)
        params[ApiKey.storage] = storage + 'GB';
      if (size != null && size.isNotEmpty) params[ApiKey.size] = size;

      try {
        final response = await api.get(
          AppEndpoint.filter,
          queryParameters: params,
        );

        final model = SearchProductModel.fromJson(response);
        return Right(model);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
