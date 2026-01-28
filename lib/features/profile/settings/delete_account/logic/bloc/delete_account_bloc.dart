import 'package:cadeau/core/cache/cacheHelper.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/features/profile/settings/delete_account/data/repository/delete_account_repo.dart';
import 'package:cadeau/features/profile/settings/delete_account/logic/bloc/delete_account_event.dart';
import 'package:cadeau/features/profile/settings/delete_account/logic/bloc/delete_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  final DeleteAccountRepo repo;

  DeleteAccountBloc(this.repo) : super(DeleteAccounInitial()) {
    on<SubmitDeleteAccountEvent>(onSubmit);
  }

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  void clearControllers() {
    emailController.clear();
    passController.clear();
  }

  Future<void> onSubmit(
    SubmitDeleteAccountEvent event,
    Emitter<DeleteAccountState> emit,
  ) async {
    if (!formKey.currentState!.validate()) return;

    emit(DeleteAccounLoading());

    final result = await repo.deleteAccountRequest(
      emailController.text.trim(),
      passController.text.trim(),
    );

    await result.fold(
      (error) async {
        emit(DeleteAccounFailure(error));
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(DeleteAccounInitial());
      },
      (model) async {
        emit(DeleteAccounSuccess(model));
        CacheHelper().removeData(key: GeneralKey.token);
        CacheHelper().removeData(key: GeneralKey.userId);
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(DeleteAccounInitial());
      },
    );
  }
}
