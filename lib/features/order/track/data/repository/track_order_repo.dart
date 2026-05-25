import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/errors/exceptions.dart';
import 'package:cadeau/core/errors/failures.dart';
import 'package:cadeau/core/network/apis/api_consumer.dart';
import 'package:cadeau/core/network/network_info.dart';
import 'package:cadeau/features/order/track/data/model/track_order_model.dart';
import 'package:dartz/dartz.dart';

class TrackOrderRepo {
  final ApiConsumer api;
  final NetworkInfo networkInfo;

  TrackOrderRepo({required this.api, required this.networkInfo});

  Future<Either<Failure, TrackOrderModel>> getOrders() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await api.get(AppEndpoint.orders, withToken: true);
        final orders = TrackOrderModel.fromJson(response);
        return Right(orders);
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
