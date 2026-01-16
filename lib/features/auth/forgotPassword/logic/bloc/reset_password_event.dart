import 'package:equatable/equatable.dart';

abstract class ResetPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitSendEmailEvent extends ResetPasswordEvent {}

class SubmitResetPassEvent extends ResetPasswordEvent {}
