import 'package:cadeau/core/cache/cacheHelper.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/features/auth/verificationAccount/data/repository/verification_account_repo.dart';
import 'package:cadeau/features/auth/verificationAccount/logic/bloc/verification_account_event.dart';
import 'package:cadeau/features/auth/verificationAccount/logic/bloc/verification_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationAccountBloc
    extends Bloc<VerificationAccountEvent, VerificationAccountState> {
  final VerificationAccountRepo repo;

  VerificationAccountBloc(this.repo) : super(VerificationAccountInitial()) {
    on<SubmitOtpEvent>(onSubmit);
  }

  final otpController = TextEditingController();

  void clearControllers() {
    otpController.clear();
  }

  Future<void> onSubmit(
    SubmitOtpEvent event,
    Emitter<VerificationAccountState> emit,
  ) async {
    emit(VerificationAccountLoading());
    int? userid = CacheHelper().getData(key: GeneralKey.userId);
    if(userid==null){
      print('errrrrrrrrrrrrrrrrrrrrrrrror');
    }
    
    final result = await repo.verifyAccountRequest(
      userid!,
      otpController.text.trim(),
    );

    await result.fold(
      (error) async {
        emit(VerificationAccountFailure(error));
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(VerificationAccountInitial());
      },
      (model) async {
        emit(VerificationAccountSuccess(model));
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(VerificationAccountInitial());
      },
    );
  }
}
