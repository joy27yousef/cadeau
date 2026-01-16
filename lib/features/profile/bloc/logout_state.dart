import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/features/profile/data/model/logout_model.dart';
import 'package:equatable/equatable.dart';

abstract class LogoutState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final LogoutModel model;
  LogoutSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class LogoutFailure extends LogoutState {
  final ErrorModel error;
  LogoutFailure(this.error);

  @override
  List<Object?> get props => [error];
}
