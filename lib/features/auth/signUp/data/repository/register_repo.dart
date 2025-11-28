import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/core/data/error/serverException.dart';
import 'package:cadeau/features/auth/signUp/data/model/register_model.dart';
import 'package:dartz/dartz.dart';

class RegisterRepo {
  final ApiConsumer api;
  RegisterRepo({required this.api});

  Future<Either<ErrorModel, RegisterModel>> registerRequest(
    String name,
    String phoneNumber,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
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
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }
}
