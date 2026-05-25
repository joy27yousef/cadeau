import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/categories/data/model/categories_model.dart';
import 'package:cadeau/features/categories/data/model/category_by_id_model.dart';
import 'package:dartz/dartz.dart';

class CategoriesRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  CategoriesRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, CategoriesModel>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get(AppEndpoint.categories);
        final categories = CategoriesModel.fromJson(response);
        return Right(categories);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, CategoryByIdModel>> getCategoryById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get('${AppEndpoint.categories}/$id');
        final category = CategoryByIdModel.fromJson(response);
        return Right(category);
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
