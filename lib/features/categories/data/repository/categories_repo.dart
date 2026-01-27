import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/core/data/error/serverException.dart';
import 'package:cadeau/features/categories/data/model/categories_model.dart';
import 'package:cadeau/features/categories/data/model/category_by_id_model.dart';
import 'package:dartz/dartz.dart';

class CategoriesRepo {
  final ApiConsumer api;

  CategoriesRepo({required this.api});

  Future<Either<ErrorModel, CategoriesModel>> getCategories() async {
    try {
      final response = await api.get(AppEndpoint.categories);
      final categories = CategoriesModel.fromJson(response);
      return Right(categories);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }

  Future<Either<ErrorModel, CategoryByIdModel>> getCategoryById(
    String id,
  ) async {
    try {
      final response = await api.get('${AppEndpoint.categories}/$id');
      final category = CategoryByIdModel.fromJson(response);
      return Right(category);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }
}
