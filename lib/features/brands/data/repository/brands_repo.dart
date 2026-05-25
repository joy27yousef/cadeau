import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/brands/data/models/brand_by_id_model.dart';
import 'package:cadeau/features/brands/data/models/brands_model.dart';
import 'package:cadeau/features/brands/data/models/follow_brand_response_model.dart';
import 'package:cadeau/features/brands/data/models/is_following_brand_model.dart';
import 'package:dartz/dartz.dart';

class BrandsRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  BrandsRepo({required this.api, required this.networkInfo});

  //get all brands
  Future<Either<Failure, BrandsModel>> getBrands() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get(AppEndpoint.brands);
        final brands = BrandsModel.fromJson(response);
        return Right(brands);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  //get brand by id
  Future<Either<Failure, BrandByIdModel>> getBrandsById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get('${AppEndpoint.brands}/$id');
        final brand = BrandByIdModel.fromJson(response);
        return Right(brand);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  // is following brand
  Future<Either<Failure, IsFollowingBrandModel>> getIsFollowBrand(
    String id,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get(
          '${AppEndpoint.brands}/$id/${AppEndpoint.isfollowing}',
          withToken: true,
        );
        final brand = IsFollowingBrandModel.fromJson(response);
        return Right(brand);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  //follow brand
  Future<Either<Failure, FollowResponseModel>> followBrand(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.post(
          '${AppEndpoint.brands}/$id${AppEndpoint.follow}',
          withToken: true,
        );
        final brand = FollowResponseModel.fromJson(response);
        return Right(brand);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, FollowResponseModel>> unFollowBrand(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.delete(
          '${AppEndpoint.brands}/$id${AppEndpoint.unfollow}',
          withToken: true,
        );
        final brand = FollowResponseModel.fromJson(response);
        return Right(brand);
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
