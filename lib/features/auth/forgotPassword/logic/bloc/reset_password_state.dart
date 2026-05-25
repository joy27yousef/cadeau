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
  final String errorMessage;

  SendEmailResendFailure(this.errorMessage);
}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPassModel model;
  ResetPasswordSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class ResetPasswordFailure extends ResetPasswordState {
  final String errorMessage;
  ResetPasswordFailure(this.errorMessage);
}
