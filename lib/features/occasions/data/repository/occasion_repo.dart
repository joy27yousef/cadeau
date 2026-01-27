import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/core/data/error/serverException.dart';
import 'package:cadeau/features/occasions/data/models/occasion_by_id_model.dart';
import 'package:cadeau/features/occasions/data/models/occasions_model.dart';
import 'package:cadeau/features/occasions/data/models/special_occasions_model.dart';
import 'package:dartz/dartz.dart';

class OccasionRepo {
  final ApiConsumer api;

  OccasionRepo({required this.api});

  Future<Either<ErrorModel, OccasionsModel>> getOccasions() async {
    try {
      final response = await api.get(AppEndpoint.occasions);
      final occasions = OccasionsModel.fromJson(response);
      return Right(occasions);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }

  Future<Either<ErrorModel, OccasionByIdModel>> getOccasionById(
    String id,
  ) async {
    try {
      final response = await api.get('${AppEndpoint.occasions}/$id');
      final occasion = OccasionByIdModel.fromJson(response);
      return Right(occasion);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }

  Future<Either<ErrorModel, SpecialOccasionsModel>>
  getSpecialOccasions() async {
    try {
      final response = await api.get(AppEndpoint.specialOccasion);
      final occasions = SpecialOccasionsModel.fromJson(response);
      return Right(occasions);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }
}
