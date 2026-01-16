import 'package:cadeau/features/occasions/data/models/occasions_model.dart';
import 'package:cadeau/features/occasions/data/repository/occasion_repo.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_event.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OccasionsBloc extends Bloc<OccasionsEvent, OccasionsState> {
  final OccasionRepo repo;

  OccasionsModel? cachedOccasions;

  OccasionsBloc({required this.repo}) : super(OccasionsInitial()) {
    on<LoadOccasions>(loadOccasions);
    on<LoadOccasionsById>(loadOccasionsById);
  }

  Future<void> loadOccasions(
    LoadOccasions event,
    Emitter<OccasionsState> emit,
  ) async {
    emit(OccasionsLoading());
    try {
      final occasions = await repo.getOccasions();
      cachedOccasions = occasions;
      emit(OccasionsSuccess(occasions));
    } catch (e) {
      emit(OccasionsError(e.toString()));
    }
  }

  Future<void> loadOccasionsById(
    LoadOccasionsById event,
    Emitter<OccasionsState> emit,
  ) async {
    emit(OccasionsLoading());
    try {
      final occasion = await repo.getOccasionById(event.occasionsId);
      emit(OccasionsByIdSuccess(occasion));
    } catch (e) {
      emit(OccasionsError(e.toString()));
    }
  }
}
