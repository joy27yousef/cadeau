import 'package:cadeau/features/auth/login/data/model/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:cadeau/core/data/error/errorModel.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel model;
  LoginSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class LoginFailure extends LoginState {
  final ErrorModel error;
  LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}
