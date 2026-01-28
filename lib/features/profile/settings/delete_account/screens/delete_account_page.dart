import 'package:cadeau/core/data/apis/dio_consumer.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/features/profile/settings/delete_account/data/repository/delete_account_repo.dart';
import 'package:cadeau/features/profile/settings/delete_account/logic/bloc/delete_account_bloc.dart';
import 'package:cadeau/features/profile/settings/delete_account/screens/widgets/delete_account_bottom.dart';
import 'package:cadeau/features/profile/settings/delete_account/screens/widgets/delete_account_inputs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Deleta Account'.tr),
      body: BlocProvider(
        create: (_) {
          final repo = DeleteAccountRepo(api: DioConsumer(dio: Dio()));
          return DeleteAccountBloc(repo);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [DeleteAccountInputs(), DeleteAccountBottom()],
          ),
        ),
      ),
    );
  }
}
