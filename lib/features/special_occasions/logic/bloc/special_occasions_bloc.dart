import 'package:cadeau/features/occasions/data/repository/occasion_repo.dart';
import 'package:cadeau/features/special_occasions/logic/bloc/special_occasions_event.dart';
import 'package:cadeau/features/special_occasions/logic/bloc/special_occasions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialOccasionsBloc
    extends Bloc<SpecialOccasionsEvent, SpecialOccasionsState> {
  final OccasionRepo repo;

  SpecialOccasionsBloc({required this.repo})
    : super(SpecialOccasionsInitial()) {
    on<LoadSpecialOccasions>(loadSpecialOccasions);
  }

  Future<void> loadSpecialOccasions(
    LoadSpecialOccasions event,
    Emitter<SpecialOccasionsState> emit,
  ) async {
    emit(SpecialOccasionsLoading());

    final occasions = await repo.getSpecialOccasions();
    occasions.fold(
      (error) {
        emit(SpecialOccasionsError(error.message));
      },
      (model) {
        emit(SpecialOccasionsByIdSuccess(model));
      },
    );
  }
}
