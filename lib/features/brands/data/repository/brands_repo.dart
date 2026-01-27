import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/core/data/error/serverException.dart';
import 'package:cadeau/features/brands/data/models/brand_by_id_model.dart';
import 'package:cadeau/features/brands/data/models/brands_model.dart';
import 'package:dartz/dartz.dart';

class BrandsRepo {
  final ApiConsumer api;

  BrandsRepo({required this.api});

  Future<Either<ErrorModel, BrandsModel>> getBrands() async {
    try {
      final response = await api.get(AppEndpoint.brands);
      final brands = BrandsModel.fromJson(response);
      return Right(brands);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }

  Future<Either<ErrorModel, BrandByIdModel>> getBrandsById(String id) async {
    try {
      final response = await api.get('${AppEndpoint.brands}/$id');
      final brand = BrandByIdModel.fromJson(response);
      return Right(brand);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }

}
