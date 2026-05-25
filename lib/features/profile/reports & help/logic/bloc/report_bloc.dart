import 'package:cadeau/features/profile/reports%20&%20help/data/repository/report_repo.dart';
import 'package:cadeau/features/profile/reports%20&%20help/logic/bloc/report_event.dart';
import 'package:cadeau/features/profile/reports%20&%20help/logic/bloc/report_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepo repo;

  ReportBloc(this.repo) : super(ReportInitial()) {
    on<SubmitReportEvent>(onSubmit);
  }

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  final nameController = TextEditingController();

  void clearControllers() {
    emailController.clear();
    subjectController.clear();
    messageController.clear();
    nameController.clear();
  }

  Future<void> onSubmit(
    SubmitReportEvent event,
    Emitter<ReportState> emit,
  ) async {
    if (!formKey.currentState!.validate()) return;

    emit(ReportLoading());

    final result = await repo.sendReport(
      emailController.text.trim(),
      nameController.text.trim(),
      subjectController.text.trim(),
      messageController.text.trim(),
    );

    await result.fold(
      (error) async {
        emit(ReportFailure(error.message));
        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(ReportInitial());
      },
      (model) async {
        emit(ReportSuccess(model));

        await Future.delayed(const Duration(seconds: 1));
        if (!emit.isDone) emit(ReportInitial());
      },
    );
  }
}
