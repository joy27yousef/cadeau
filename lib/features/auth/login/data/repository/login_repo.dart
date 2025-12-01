import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/core/data/error/serverException.dart';
import 'package:cadeau/features/auth/login/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

class LoginRepo {
  final ApiConsumer api;
  LoginRepo({required this.api});

  Future<Either<ErrorModel, LoginModel>> loginRequest(
    String email,
    String password,
  ) async {
    try {
      final response = await api.post(
        AppEndpoint.login,
        data: {ApiKey.email: email, ApiKey.password: password},
        withToken: false,
      );
      final loginUser = LoginModel.fromJson(response);
      return Right(loginUser);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }
}
