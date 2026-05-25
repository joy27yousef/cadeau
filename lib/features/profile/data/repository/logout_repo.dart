import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';

import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/profile/data/model/logout_model.dart';
import 'package:dartz/dartz.dart';

class LogoutRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  LogoutRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, LogoutModel>> logoutRequest() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.delete(AppEndpoint.logout, withToken: true);
        final logoutUser = LogoutModel.fromJson(response);
        return Right(logoutUser);
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
