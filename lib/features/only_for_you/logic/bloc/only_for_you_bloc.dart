import 'package:cadeau/features/only_for_you/data/repository/only_for_you_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'only_for_you_event.dart';
import 'only_for_you_state.dart';

class OnlyForYouBloc extends Bloc<OnlyForYouEvent, OnlyForYouState> {
  final OnlyForYouRepo onlyForYouRepo;

  OnlyForYouBloc({required this.onlyForYouRepo}) : super(OnlyForYouInitial()) {
    on<GetOnlyForYouDataEvent>((event, emit) async {
      emit(OnlyForYouLoading());

      final result = await onlyForYouRepo.getOnlyForYou();

      result.fold(
        (errorModel) => emit(OnlyForYouFailure(errorModel: errorModel.message)),
        (onlyForYouModel) =>
            emit(OnlyForYouSuccess(onlyForYouModel: onlyForYouModel)),
      );
    });
  }
}
