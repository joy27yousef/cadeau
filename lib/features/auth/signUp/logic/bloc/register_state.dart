import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:equatable/equatable.dart';
import '../../data/model/register_model.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterModel model;
  RegisterSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class RegisterFailure extends RegisterState {
  final ErrorModel error;
  RegisterFailure(this.error);

  @override
  List<Object?> get props => [error];
}
