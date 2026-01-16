import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/data/apis/dio_consumer.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/features/auth/verificationAccount/data/repository/verification_account_repo.dart';
import 'package:cadeau/features/auth/verificationAccount/logic/bloc/verification_account_bloc.dart';
import 'package:cadeau/features/auth/verificationAccount/screens/widgets/verification_account_input.dart';
import 'package:cadeau/features/auth/verificationAccount/screens/widgets/veriification_account_buttom.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class VerificationAccountPage extends StatelessWidget {
  const VerificationAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppbarScreens(title: 'Verification'.tr),
      body: BlocProvider<VerificationAccountBloc>(
        create: (_) {
          final repo = VerificationAccountRepo(api: DioConsumer(dio: Dio()));
          return VerificationAccountBloc(repo);
        },
        child: SafeArea(
          child: Column(
            children: [
              VerificationAccountInput(),
              VeriificationAccountButtom(),
            ],
          ),
        ),
      ),
    );
  }
}
