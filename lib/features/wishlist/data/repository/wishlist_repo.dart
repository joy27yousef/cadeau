import 'package:cadeau/core/data/apis/api_consumer.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/core/data/error/serverException.dart';
import 'package:cadeau/features/wishlist/data/models/add_remove_wishlist.dart';
import 'package:cadeau/features/wishlist/data/models/my_wishlist_model.dart';
import 'package:dartz/dartz.dart';

class WishlistRepo {
  final ApiConsumer api;

  WishlistRepo({required this.api});

  Future<Either<ErrorModel, AddRemoveWishlistModel>> addToWishlist(
    String id,
  ) async {
    try {
      final response = await api.post(
        AppEndpoint.wishlistAdd,
        data: {ApiKey.productId: id},
        withToken: true,
      );
      final item = AddRemoveWishlistModel.fromJson(response);
      return Right(item);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }

  Future<Either<ErrorModel, AddRemoveWishlistModel>> removeFromWishlist(
    String id,
  ) async {
    try {
      final response = await api.delete(
        AppEndpoint.wishlistRemove,
        data: {ApiKey.productId: id},
        withToken: true,
      );
      final item = AddRemoveWishlistModel.fromJson(response);
      return Right(item);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }

  Future<Either<ErrorModel, MyWishlistModel>> getMyWishlist() async {
    try {
      final response = await api.get(AppEndpoint.wishlist, withToken: true);

      final item = MyWishlistModel.fromJson(response);

      return Right(item);
    } on ServerException catch (e) {
      return Left(e.errModel);
    } catch (e) {
      return Left(ErrorModel(status: false, message: e.toString()));
    }
  }
}
