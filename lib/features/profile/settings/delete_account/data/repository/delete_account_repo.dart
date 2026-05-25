import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/profile/settings/delete_account/data/models/delete_account_model.dart';
import 'package:dartz/dartz.dart';

class DeleteAccountRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  DeleteAccountRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, DeleteAccountModel>> deleteAccountRequest(
    String email,
    String password,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.delete(
          AppEndpoint.accountRemoval,
          data: {ApiKey.email: email, ApiKey.password: password},
          withToken: true,
        );
        final data = DeleteAccountModel.fromJson(response);
        return Right(data);
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
