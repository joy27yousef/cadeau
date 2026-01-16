import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/features/auth/verificationAccount/data/models/verification_account_model.dart';
import 'package:equatable/equatable.dart';

abstract class VerificationAccountState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerificationAccountInitial extends VerificationAccountState {}

class VerificationAccountLoading extends VerificationAccountState {}

class VerificationAccountSuccess extends VerificationAccountState {
  final VerificationAccountModel model;
  VerificationAccountSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class VerificationAccountFailure extends VerificationAccountState {
  final ErrorModel error;
  VerificationAccountFailure(this.error);

  @override
  List<Object?> get props => [error];
}
