import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/core/data/error/serverException.dart';
import 'package:cadeau/features/auth/verificationAccount/data/models/verification_account_model.dart';
import 'package:dartz/dartz.dart';

class VerificationAccountRepo {
  final ApiConsumer api;
  VerificationAccountRepo({required this.api});

  Future<Either<ErrorModel, VerificationAccountModel>> verifyAccountRequest(
    int userId,
    String otp,
  ) async {
    try {
      final response = await api.post(
        AppEndpoint.verifyAccount,
        data: {ApiKey.userId: userId, ApiKey.otp: otp},
        withToken: false,
      );
      final userVerify = VerificationAccountModel.fromJson(response);
      return Right(userVerify);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }
}
