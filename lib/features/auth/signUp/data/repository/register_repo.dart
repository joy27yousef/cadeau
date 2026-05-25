import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/auth/signUp/data/model/register_model.dart';
import 'package:dartz/dartz.dart';

class RegisterRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  RegisterRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, RegisterModel>> registerRequest(
    String name,
    String phoneNumber,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.post(
          AppEndpoint.rigister,
          data: {
            ApiKey.name: name,
            ApiKey.phoneNumber: phoneNumber,
            ApiKey.email: email,
            ApiKey.password: password,
            ApiKey.passwordConfirmation: passwordConfirmation,
          },
          withToken: false,
        );
        final registerUser = RegisterModel.fromJson(response);
        return Right(registerUser);
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
