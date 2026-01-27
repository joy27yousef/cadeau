import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/core/data/error/serverException.dart';
import 'package:cadeau/features/product/data/models/all_product_model.dart';
import 'package:cadeau/features/product/data/models/latest_product_model.dart';
import 'package:cadeau/features/product/data/models/product_by_id_model.dart';
import 'package:dartz/dartz.dart';

class ProductRepo {
  final ApiConsumer api;

  ProductRepo({required this.api});

  Future<Either<ErrorModel, AllProductModel>> getAllProducts() async {
    try {
      final response = await api.get(AppEndpoint.products);
      final products = AllProductModel.fromJson(response);
      return Right(products);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }

  Future<Either<ErrorModel, ProductByIdModel>> getProductById(String id) async {
    try {
      final response = await api.get('${AppEndpoint.products}/$id');
      final product = ProductByIdModel.fromJson(response);
      return Right(product);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }

  Future<Either<ErrorModel, LatestProductModel>> getLatestProduct() async {
    try {
      final response = await api.get(AppEndpoint.latestProducts);
      final product = LatestProductModel.fromJson(response);
      return Right(product);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }
}
