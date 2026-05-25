import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/wishlist/data/models/add_remove_wishlist.dart';
import 'package:cadeau/features/wishlist/data/models/my_wishlist_model.dart';
import 'package:dartz/dartz.dart';

class WishlistRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  WishlistRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, AddRemoveWishlistModel>> addToWishlist(
    String id,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.post(
          AppEndpoint.wishlistAdd,
          data: {ApiKey.productId: id},
          withToken: true,
        );
        final item = AddRemoveWishlistModel.fromJson(response);
        return Right(item);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, AddRemoveWishlistModel>> removeFromWishlist(
    String id,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.delete(
          AppEndpoint.wishlistRemove,
          data: {ApiKey.productId: id},
          withToken: true,
        );
        final item = AddRemoveWishlistModel.fromJson(response);
        return Right(item);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, MyWishlistModel>> getMyWishlist() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get(AppEndpoint.wishlist, withToken: true);

        final item = MyWishlistModel.fromJson(response);

        return Right(item);
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
