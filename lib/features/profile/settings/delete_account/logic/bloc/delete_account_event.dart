import 'package:equatable/equatable.dart';

abstract class DeleteAccountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitDeleteAccountEvent extends DeleteAccountEvent {}
