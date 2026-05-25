import 'package:cadeau/features/order/track/data/repository/track_order_repo.dart';
import 'package:cadeau/features/order/track/logic/bloc/track_order_event.dart';
import 'package:cadeau/features/order/track/logic/bloc/track_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackOrderBloc extends Bloc<TrackOrderEvent, TrackOrderState> {
  final TrackOrderRepo repo;

  TrackOrderBloc({required this.repo}) : super(TrackOrderInitial()) {
    on<LoadTrackOrder>(loadTrackOrder);
  }

  Future<void> loadTrackOrder(
    TrackOrderEvent event,
    Emitter<TrackOrderState> emit,
  ) async {
    emit(TrackOrderLoading());

    final order = await repo.getOrders();
    order.fold(
      (error) {
        emit(TrackOrderError(error.message));
      },
      (model) {
        emit(TrackOrderSuccess(model));
      },
    );
  }
}
