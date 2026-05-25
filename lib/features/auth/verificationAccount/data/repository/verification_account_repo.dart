import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';

import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/auth/verificationAccount/data/models/verification_account_model.dart';
import 'package:dartz/dartz.dart';

class VerificationAccountRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  VerificationAccountRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, VerificationAccountModel>> verifyAccountRequest(
    int userId,
    String otp,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.post(
          AppEndpoint.verifyAccount,
          data: {ApiKey.userId: userId, ApiKey.otp: otp},
          withToken: false,
        );
        final userVerify = VerificationAccountModel.fromJson(response);
        return Right(userVerify);
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
