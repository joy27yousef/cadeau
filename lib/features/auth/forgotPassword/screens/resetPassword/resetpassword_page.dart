import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/data/apis/dio_consumer.dart';
import 'package:cadeau/core/functions/message.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/features/auth/forgotPassword/data/repository/reset_pass_repo.dart';
import 'package:cadeau/features/auth/forgotPassword/logic/bloc/reset_password_bloc.dart';
import 'package:cadeau/features/auth/forgotPassword/logic/bloc/reset_password_event.dart';
import 'package:cadeau/features/auth/forgotPassword/logic/bloc/reset_password_state.dart';
import 'package:cadeau/features/auth/forgotPassword/screens/resetPassword/widgets/reset_password_input.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ResetpasswordPage extends StatelessWidget {
  const ResetpasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Reset Password'.tr),
      body: BlocProvider(
        create: (_) {
          final repo = ResetPassRepo(api: DioConsumer(dio: Dio()));
          return ResetPasswordBloc(repo);
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResetPasswordInput(),
              BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordSuccess) {
                    showMessage(
                      context,
                      message: state.model.message,
                      isSuccess: true,
                    );
                    Get.offAllNamed(AppRoutes.login);
                  } else if (state is ResetPasswordFailure) {
                    showMessage(
                      context,
                      message: state.error.message,
                      isSuccess: false,
                    );
                  }
                },
                builder: (context, state) {
                  final bloc = context.read<ResetPasswordBloc>();

                  bool isLoading = state is ResetPasswordLoading;
                  return BoxButtom(
                    color: AppColor.mainColor,
                    isLoading: isLoading,
                    ontapfun: () {
                      bloc.add(SubmitResetPassEvent());
                    },
                    text: 'Set New Password'.tr,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
