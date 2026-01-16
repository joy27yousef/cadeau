import 'package:cadeau/core/cache/cacheHelper.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/features/auth/login/data/repository/login_repo.dart';
import 'package:cadeau/features/auth/login/logic/bloc/login_event.dart';
import 'package:cadeau/features/auth/login/logic/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo repo;

  LoginBloc(this.repo) : super(LoginInitial()) {
    on<SubmitLoginEvent>(onSubmit);
  }

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  void clearControllers() {
    emailController.clear();
    passController.clear();
  }

  Future<void> onSubmit(
    SubmitLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginLoading());

    final result = await repo.loginRequest(
      emailController.text.trim(),
      passController.text.trim(),
    );

    await result.fold(
      (error) async {
        emit(LoginFailure(error));
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(LoginInitial());
      },
      (model) async {
        emit(LoginSuccess(model));
        CacheHelper().removeData(key: GeneralKey.token);
        CacheHelper().saveData(
          key: GeneralKey.token,
          value: model.data.accessToken,
        );
        print("🐣${model.data.accessToken}");
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(LoginInitial());
      },
    );
  }
}
