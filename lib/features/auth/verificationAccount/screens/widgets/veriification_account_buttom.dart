import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/message.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/features/auth/verificationAccount/logic/bloc/verification_account_bloc.dart';
import 'package:cadeau/features/auth/verificationAccount/logic/bloc/verification_account_event.dart';
import 'package:cadeau/features/auth/verificationAccount/logic/bloc/verification_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class VeriificationAccountButtom extends StatelessWidget {
  const VeriificationAccountButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationAccountBloc, VerificationAccountState>(
      listener: (context, state) {
        if (state is VerificationAccountSuccess) {
          showMessage(context, message: state.model.message!, isSuccess: true);
          Get.offAllNamed(AppRoutes.login);
        } else if (state is VerificationAccountFailure) {
          showMessage(context, message: state.error.message, isSuccess: false);
        }
      },
      builder: (context, state) {
        final bloc = context.read<VerificationAccountBloc>();

        bool isLoading = state is VerificationAccountLoading;
        return Padding(
          padding: EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: BoxButtom(
            color: AppColor.mainColor,
            isLoading: isLoading,
            ontapfun: () {
              bloc.add(SubmitOtpEvent());
            },
            text: 'Send Code'.tr,
          ),
        );
      },
    );
  }
}
