import 'package:cadeau/core/cache/cacheHelper.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/features/auth/login/data/repository/login_repo.dart';
import 'package:cadeau/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo repo;

  LoginCubit(this.repo) : super(LoginInitial());

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  void clearControllers() {
    emailController.clear();
    passController.clear();
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginLoading());

    final result = await repo.loginRequest(
      emailController.text.trim(),
      passController.text.trim(),
    );

    result.fold(
      (error) {
        emit(LoginFailure(error));
        Future.delayed(Duration(seconds: 1), () => emit(LoginInitial()));
      },
      (model) async {
        CacheHelper().removeData(key: GeneralKey.token);
        CacheHelper().saveData(
          key: GeneralKey.token,
          value: model.data.accessToken,
        );
        emit(LoginSuccess(model));
        Future.delayed(Duration(seconds: 1), () => emit(LoginInitial()));
      },
    );
  }
}
