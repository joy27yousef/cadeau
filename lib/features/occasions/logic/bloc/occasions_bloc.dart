
import 'package:cadeau/features/occasions/data/repository/occasion_repo.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_event.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OccasionsBloc extends Bloc<OccasionsEvent, OccasionsState> {
  final OccasionRepo repo;

  OccasionsBloc({required this.repo}) : super(OccasionsInitial()) {
    on<LoadOccasions>(loadOccasions);
    on<LoadOccasionsById>(loadOccasionsById);

  }

  Future<void> loadOccasions(
    LoadOccasions event,
    Emitter<OccasionsState> emit,
  ) async {
    emit(OccasionsLoading());

    final occasions = await repo.getOccasions();
    occasions.fold(
      (error) {
        emit(OccasionsError(error.message));
      },
      (model) {
        emit(OccasionsSuccess(model));
      },
    );
  }

  Future<void> loadOccasionsById(
    LoadOccasionsById event,
    Emitter<OccasionsState> emit,
  ) async {
    emit(OccasionsByIdLoading());

    final occasion = await repo.getOccasionById(event.occasionsId);
    occasion.fold(
      (error) {
        emit(OccasionsByIdError(error.message));
      },
      (model) {
        emit(OccasionsByIdSuccess(model));
      },
    );
  }

}
