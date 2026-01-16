import 'package:cadeau/core/cache/cacheHelper.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/features/profile/bloc/logout_event.dart';
import 'package:cadeau/features/profile/bloc/logout_state.dart';
import 'package:cadeau/features/profile/data/repository/logout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutRepo repo;

  LogoutBloc(this.repo) : super(LogoutInitial()) {
    on<SubmitLogoutEvent>(onSubmit);
  }

  Future<void> onSubmit(
    SubmitLogoutEvent event,
    Emitter<LogoutState> emit,
  ) async {
    emit(LogoutLoading());
    final result = await repo.logoutRequest();

    await result.fold(
      (error) async {
        emit(LogoutFailure(error));
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(LogoutInitial());
      },
      (model) async {
        emit(LogoutSuccess(model));
        CacheHelper().removeData(key: GeneralKey.token);
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(LogoutInitial());
      },
    );
  }
}
