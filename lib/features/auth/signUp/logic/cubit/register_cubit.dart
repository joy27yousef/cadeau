import 'package:cadeau/features/auth/signUp/data/repository/register_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo repo;

  RegisterCubit(this.repo) : super(RegisterInitial());

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();

  void clearControllers() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    passController.clear();
    confirmController.clear();
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

    emit(RegisterLoading());

    final result = await repo.registerRequest(
      nameController.text.trim(),
      phoneController.text.trim(),
      emailController.text.trim(),
      passController.text.trim(),
      confirmController.text.trim(),
    );

    result.fold(
      (error) {
        emit(RegisterFailure(error));
        Future.delayed(Duration(seconds: 1), () => emit(RegisterInitial()));
      },
      (model) {
        emit(RegisterSuccess(model));
        Future.delayed(Duration(seconds: 1), () => emit(RegisterInitial()));
      },
    );
  }
}
