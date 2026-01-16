import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/features/auth/forgotPassword/data/models/reset_pass_model.dart';
import 'package:cadeau/features/auth/forgotPassword/data/models/send_email_model.dart';
import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class SendEmailResendLoading extends ResetPasswordState {}

class SendEmailResendSuccess extends ResetPasswordState {
  final SendEmailModel model;
  SendEmailResendSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class SendEmailResendFailure extends ResetPasswordState {
  final ErrorModel error;
  SendEmailResendFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPassModel model;
  ResetPasswordSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class ResetPasswordFailure extends ResetPasswordState {
  final ErrorModel error;
  ResetPasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}
