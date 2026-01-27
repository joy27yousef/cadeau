import 'package:cadeau/features/occasions/data/models/occasions_model.dart';
import 'package:cadeau/features/occasions/data/models/special_occasions_model.dart';
import 'package:cadeau/features/occasions/data/repository/occasion_repo.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_event.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OccasionsBloc extends Bloc<OccasionsEvent, OccasionsState> {
  final OccasionRepo repo;

  OccasionsModel? cachedOccasions;
  SpecialOccasionsModel? cachedSpecialOccasions;

  OccasionsBloc({required this.repo}) : super(OccasionsInitial()) {
    on<LoadOccasions>(loadOccasions);
    on<LoadOccasionsById>(loadOccasionsById);
    on<LoadSpecialOccasions>(loadSpecialOccasions);
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
        cachedOccasions = model;
        emit(OccasionsSuccess(model));
      },
    );
  }

  Future<void> loadOccasionsById(
    LoadOccasionsById event,
    Emitter<OccasionsState> emit,
  ) async {
    emit(OccasionsLoading());

    final occasion = await repo.getOccasionById(event.occasionsId);
    occasion.fold(
      (error) {
        emit(OccasionsError(error.message));
      },
      (model) {
        emit(OccasionsByIdSuccess(model));
      },
    );
  }

  Future<void> loadSpecialOccasions(
    LoadSpecialOccasions event,
    Emitter<OccasionsState> emit,
  ) async {
    emit(OccasionsLoading());

    final occasions = await repo.getSpecialOccasions();
    occasions.fold(
      (error) {
        emit(OccasionsError(error.message));
      },
      (model) {
        cachedSpecialOccasions = model;
        emit(SpecialOccasionsByIdSuccess(model));
      },
    );
  }
}
