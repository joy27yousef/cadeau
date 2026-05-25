import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/occasions/data/models/occasion_by_id_model.dart';
import 'package:cadeau/features/occasions/data/models/occasions_model.dart';
import 'package:cadeau/features/special_occasions/data/models/special_occasions_model.dart';
import 'package:dartz/dartz.dart';

class OccasionRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  OccasionRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, OccasionsModel>> getOccasions() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get(AppEndpoint.occasions);
        final occasions = OccasionsModel.fromJson(response);
        return Right(occasions);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, OccasionByIdModel>> getOccasionById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get('${AppEndpoint.occasions}/$id');
        final occasion = OccasionByIdModel.fromJson(response);
        return Right(occasion);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, SpecialOccasionsModel>> getSpecialOccasions() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get(AppEndpoint.specialOccasion);
        final occasions = SpecialOccasionsModel.fromJson(response);
        return Right(occasions);
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
