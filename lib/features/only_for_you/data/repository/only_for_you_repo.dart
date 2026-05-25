import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/only_for_you/data/models/only_for_you_model.dart';
import 'package:dartz/dartz.dart';

class OnlyForYouRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  OnlyForYouRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, OnlyForYouModel>> getOnlyForYou() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get(AppEndpoint.onlyForYou, withToken: true);
        final product = OnlyForYouModel.fromJson(response);
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
