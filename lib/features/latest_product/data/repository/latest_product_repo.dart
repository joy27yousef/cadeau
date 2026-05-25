import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/latest_product/data/models/latest_product_model.dart';
import 'package:dartz/dartz.dart';

class LatestProductRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  LatestProductRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, LatestProductModel>> getLatestProduct() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get(AppEndpoint.latestProducts);
        final product = LatestProductModel.fromJson(response);
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
}
