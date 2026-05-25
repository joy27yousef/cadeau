import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/product/data/models/add_rating_model.dart';
import 'package:cadeau/features/product/data/models/all_product_model.dart';
import 'package:cadeau/features/product/data/models/product_by_id_model.dart';
import 'package:dartz/dartz.dart';

class ProductRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  ProductRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, AllProductModel>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get(AppEndpoint.products);
        final products = AllProductModel.fromJson(response);
        return Right(products);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, ProductByIdModel>> getProductById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get('${AppEndpoint.products}/$id');
        final product = ProductByIdModel.fromJson(response);
        return Right(product);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, AddRatingResponse>> addRating(
    int productId,
    double rat,
    String review,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.post(
          AppEndpoint.rating,
          data: {
            ApiKey.productId: productId,
            ApiKey.review: review,
            ApiKey.rating: rat,
          },
          withToken: false,
        );
        final rating = AddRatingResponse.fromJson(response);
        return Right(rating);
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
