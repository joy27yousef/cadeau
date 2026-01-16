import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/core/data/error/serverException.dart';
import 'package:cadeau/features/auth/forgotPassword/data/models/reset_pass_model.dart';
import 'package:cadeau/features/auth/forgotPassword/data/models/send_email_model.dart';
import 'package:dartz/dartz.dart';

class ResetPassRepo {
  final ApiConsumer api;
  ResetPassRepo({required this.api});

  Future<Either<ErrorModel, SendEmailModel>> sendEmailRequest(
    String email,
  ) async {
    try {
      final response = await api.post(
        AppEndpoint.sendResetCode,
        data: {ApiKey.email: email},
        withToken: false,
      );
      final user = SendEmailModel.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }

  Future<Either<ErrorModel, ResetPassModel>> resetPassRequest(
    String otp,
    String password,
    String confirmPassword,
  ) async {
    try {
      final response = await api.post(
        AppEndpoint.resetPassword,
        data: {
          ApiKey.otp: otp,
          ApiKey.password: password,
          ApiKey.passwordConfirmation: confirmPassword,
        },
        withToken: false,
      );
      final user = ResetPassModel.fromJson(response);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }
}
