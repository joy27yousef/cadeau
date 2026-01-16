import 'package:cadeau/core/functions/valid_inputs.dart';
import 'package:cadeau/core/widgets/title_input.dart';
import 'package:cadeau/core/widgets/welcome_part.dart';
import 'package:cadeau/features/auth/forgotPassword/logic/bloc/reset_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ForgotInputs extends StatelessWidget {
  const ForgotInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final bolc = context.read<ResetPasswordBloc>();

    return Column(
      children: [
        WelcomePart(
          text1: 'Reset With Email Address'.tr,
          text2:
              'Please enter your email address to get a verification code..'.tr,
        ),
        Form(
          key: bolc.formKey,
          child: TitleInput(
            text: 'Email Address'.tr,
            lable: 'email@gmail.com'.tr,
            keyboard: TextInputType.emailAddress,
            mycontroller: bolc.emailController,
            valid: (value) =>
                ValidInputs.validateEmail(value ?? "", email: value ?? ""),
          ),
        ),
      ],
    );
  }
}
