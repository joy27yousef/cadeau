import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/auth/login/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

class LoginRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  LoginRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, LoginModel>> loginRequest(
    String email,
    String password,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.post(
          AppEndpoint.login,
          data: {ApiKey.email: email, ApiKey.password: password},
          withToken: false,
        );
        final loginUser = LoginModel.fromJson(response);
        return Right(loginUser);
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
