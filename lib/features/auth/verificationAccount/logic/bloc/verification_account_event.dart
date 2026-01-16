import 'package:equatable/equatable.dart';

abstract class VerificationAccountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitOtpEvent extends VerificationAccountEvent {}
