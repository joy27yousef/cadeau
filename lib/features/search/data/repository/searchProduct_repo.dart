import 'dart:math';

import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';

import 'package:cadeau/features/search/data/models/search_product_model.dart';
import 'package:dartz/dartz.dart';

class SearchproductRepo {
  final ApiConsumer api;

  SearchproductRepo({required this.api});

  Future<Either<ErrorModel, SearchProductModel>> getFilteredProducts({
    String? categoryId,
    String? brandId,
    double? priceFrom,
    double? priceTo,
    String? searchQuery,
  }) async {
    final Map<String, dynamic> params = {};

    if (categoryId != null) params['categoryId'] = categoryId;
    if (brandId != null) params['brandId'] = brandId;
    if (priceFrom != null) params['priceFrom'] = priceFrom;
    if (priceTo != null) params['priceTo'] = priceTo;
    if (searchQuery != null) params['search'] = searchQuery;

    try {
      final response = await api.get(
        AppEndpoint.filter,
        queryParameters: params,
      );

      final model = SearchProductModel.fromJson(response);
      return Right(model);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }
}
