import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/cart/data/model/add_to_cart_model.dart';
import 'package:cadeau/features/cart/data/model/remove_from_cart_model.dart';
import 'package:cadeau/features/cart/data/model/view_cart_model.dart';
import 'package:dartz/dartz.dart';

class CartRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  CartRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, AddToCartModel>> addToCardResponse(
    int productId,
    int variantId,
    int quantity,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.post(
          AppEndpoint.addtoCart,
          data: {
            ApiKey.productId: productId,
            ApiKey.variantId: variantId,
            ApiKey.quantity: quantity,
          },
          withToken: true,
        );
        final cart = AddToCartModel.fromJson(response);
        return Right(cart);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, ViewCartModel>> getCartResponse() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get(AppEndpoint.getCart, withToken: true);
        final cart = ViewCartModel.fromJson(response);
        return Right(cart);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message, statusCode: e.statusCode));
      } catch (e) {
        return Left(ServerFailure('😭😭Error in: ${e.toString()}'));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, RemoveFromCartModel>> removeFromCartResponse(
    int productId,
    int variantId,
    int quantity,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.delete(
          AppEndpoint.removeCart,
          data: {
            ApiKey.productId: productId,
            ApiKey.variantId: variantId,
            ApiKey.quantity: quantity,
          },
          withToken: true,
        );
        final cart = RemoveFromCartModel.fromJson(response);
        return Right(cart);
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
