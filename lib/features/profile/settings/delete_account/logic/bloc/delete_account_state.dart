import 'package:cadeau/core/data/error/errorModel.dart';
import 'package:cadeau/features/profile/settings/delete_account/data/models/delete_account_model.dart';
import 'package:equatable/equatable.dart';

abstract class DeleteAccountState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteAccounInitial extends DeleteAccountState {}

class DeleteAccounLoading extends DeleteAccountState {}

class DeleteAccounSuccess extends DeleteAccountState {
  final DeleteAccountModel deleteAccountModel;
  DeleteAccounSuccess(this.deleteAccountModel);

  @override
  List<Object?> get props => [deleteAccountModel];
}

class DeleteAccounFailure extends DeleteAccountState {
  final ErrorModel error;
  DeleteAccounFailure(this.error);

  @override
  List<Object?> get props => [error];
}
