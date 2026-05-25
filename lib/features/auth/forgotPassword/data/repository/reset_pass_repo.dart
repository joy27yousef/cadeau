import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/auth/forgotPassword/data/models/reset_pass_model.dart';
import 'package:cadeau/features/auth/forgotPassword/data/models/send_email_model.dart';
import 'package:dartz/dartz.dart';

class ResetPassRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  ResetPassRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, SendEmailModel>> sendEmailRequest(String email) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.post(
          AppEndpoint.sendResetCode,
          data: {ApiKey.email: email},
          withToken: false,
        );
        final user = SendEmailModel.fromJson(response);
        return Right(user);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, ResetPassModel>> resetPassRequest(
    String otp,
    String password,
    String confirmPassword,
  ) async {
    if (await networkInfo.isConnected) {
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
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
