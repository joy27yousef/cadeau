import 'package:cadeau/features/order/track/data/model/track_order_model.dart';

abstract class TrackOrderState {}

class TrackOrderInitial extends TrackOrderState {}

class TrackOrderLoading extends TrackOrderState {}

class TrackOrderSuccess extends TrackOrderState {
  final TrackOrderModel order;
  TrackOrderSuccess(this.order);
}

class TrackOrderError extends TrackOrderState {
  final String message;
  TrackOrderError(this.message);
}
