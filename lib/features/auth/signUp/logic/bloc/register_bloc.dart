import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';
import '../../data/repository/register_repo.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepo repo;

  RegisterBloc(this.repo) : super(RegisterInitial()) {
    on<SubmitRegisterEvent>(onSubmit);
  }

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

  Future<void> onSubmit(
    SubmitRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    if (!formKey.currentState!.validate()) return;

    emit(RegisterLoading());

    final result = await repo.registerRequest(
      nameController.text.trim(),
      phoneController.text.trim(),
      emailController.text.trim(),
      passController.text.trim(),
      confirmController.text.trim(),
    );

    await result.fold(
      (error) async {
        emit(RegisterFailure(error));
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(RegisterInitial());
      },
      (model) async {
        emit(RegisterSuccess(model));
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(RegisterInitial());
      },
    );
  }
}
