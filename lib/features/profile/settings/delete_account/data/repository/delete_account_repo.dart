import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/core/data/error/serverException.dart';
import 'package:cadeau/features/profile/settings/delete_account/data/models/delete_account_model.dart';
import 'package:dartz/dartz.dart';

class DeleteAccountRepo {
  final ApiConsumer api;
  DeleteAccountRepo({required this.api});

  Future<Either<ErrorModel, DeleteAccountModel>> deleteAccountRequest(
    String email,
    String password,
  ) async {
    try {
      final response = await api.delete(
        AppEndpoint.accountRemoval,
        data: {ApiKey.email: email, ApiKey.password: password},
        withToken: true,
      );
      final data = DeleteAccountModel.fromJson(response);
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }
}
