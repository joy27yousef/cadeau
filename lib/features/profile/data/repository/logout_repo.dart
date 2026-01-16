import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/core/data/error/serverException.dart';
import 'package:cadeau/features/profile/data/model/logout_model.dart';
import 'package:dartz/dartz.dart';

class LogoutRepo {
  final ApiConsumer api;
  LogoutRepo({required this.api});

  Future<Either<ErrorModel, LogoutModel>> logoutRequest() async {
    try {
      final response = await api.delete(AppEndpoint.logout, withToken: true);
      final logoutUser = LogoutModel.fromJson(response);
      return Right(logoutUser);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }
}
