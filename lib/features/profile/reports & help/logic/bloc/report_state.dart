import 'package:cadeau/features/auth/login/data/model/login_model.dart';
import 'package:cadeau/features/profile/reports%20&%20help/data/model/report_model.dart';
import 'package:equatable/equatable.dart';

abstract class ReportState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportSuccess extends ReportState {
  final ReportModel model;
  ReportSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class ReportFailure extends ReportState {
  final String error;
  ReportFailure(this.error);

  @override
  List<Object?> get props => [error];
}
