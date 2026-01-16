import 'package:cadeau/features/auth/forgotPassword/data/repository/reset_pass_repo.dart';
import 'package:cadeau/features/auth/forgotPassword/logic/bloc/reset_password_event.dart';
import 'package:cadeau/features/auth/forgotPassword/logic/bloc/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPassRepo repo;

  ResetPasswordBloc(this.repo) : super(ResetPasswordInitial()) {
    on<SubmitSendEmailEvent>(onSubmitSendEmail);
    on<SubmitResetPassEvent>(onSubmitResetPass);
  }

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otpController = TextEditingController();

  void clearControllers() {
    emailController.clear();
  }

  Future<void> onSubmitSendEmail(
    SubmitSendEmailEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    if (!formKey.currentState!.validate()) return;

    emit(SendEmailResendLoading());

    final result = await repo.sendEmailRequest(emailController.text.trim());

    await result.fold(
      (error) async {
        emit(SendEmailResendFailure(error));
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(ResetPasswordInitial());
      },
      (model) async {
        emit(SendEmailResendSuccess(model));

        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(ResetPasswordInitial());
      },
    );
  }

  Future<void> onSubmitResetPass(
    SubmitResetPassEvent event,
    Emitter<ResetPasswordState> emit,
  ) async {
    if (!formKey.currentState!.validate()) return;

    emit(ResetPasswordLoading());

    final result = await repo.resetPassRequest(
      otpController.text.trim(),
      passwordController.text.trim(),
      confirmPasswordController.text.trim(),
    );

    await result.fold(
      (error) async {
        emit(ResetPasswordFailure(error));
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(ResetPasswordInitial());
      },
      (model) async {
        emit(ResetPasswordSuccess(model));

        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(ResetPasswordInitial());
      },
    );
  }
}
