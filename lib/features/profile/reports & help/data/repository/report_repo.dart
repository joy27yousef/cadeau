import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';

import 'package:cadeau/features/profile/reports%20&%20help/data/model/report_model.dart';
import 'package:dartz/dartz.dart';

class ReportRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  ReportRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, ReportModel>> sendReport(
    String email,
    String userName,
    String subject,
    String message,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.post(
          AppEndpoint.contactUs,
          data: {
            ApiKey.email: email,
            ApiKey.userName: userName,
            ApiKey.subject: subject,
            ApiKey.message: message,
          },
          withToken: true,
        );
        final report = ReportModel.fromJson(response);
        return Right(report);
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
