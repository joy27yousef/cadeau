import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/valid_inputs.dart';
import 'package:cadeau/core/widgets/title_input.dart';
import 'package:cadeau/core/widgets/welcome_part.dart';
import 'package:cadeau/features/auth/forgotPassword/logic/bloc/reset_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class ResetPasswordInput extends StatelessWidget {
  const ResetPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ResetPasswordBloc>();

    return Form(
      key: bloc.formKey,
      child: Expanded(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              'Please enter the 6-character identification number that was sent to your personal email in order to authenticate the account.',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 40),
            OtpTextField(
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 6,
              borderColor: AppColor.mainColor,
              focusedBorderColor: AppColor.mainColor,
              showFieldAsBox: true,
              fieldWidth: 40,
              cursorColor: AppColor.mainColor,
              onSubmit: (code) {
                bloc.otpController.text = code;
              },
              onCodeChanged: (code) {
                if (code.length == 6) {
                  bloc.otpController.text = code;
                }
              },
            ),
            const SizedBox(height: 40),
            WelcomePart(
              text1: 'Set New Password'.tr,
              text2: 'Please enter your new password'.tr,
              withspace: false,
            ),
            TitleInput(
              text: 'Password'.tr,
              lable: '********',
              keyboard: TextInputType.text,
              mycontroller: bloc.passwordController,
              withSpace: false,
              valid: (value) =>
                  ValidInputs.validatePassword(password: value ?? ""),
            ),
            TitleInput(
              text: 'Confirm Password'.tr,
              lable: '********',
              keyboard: TextInputType.text,
              mycontroller: bloc.confirmPasswordController,
              withSpace: false,
              valid: (value) => ValidInputs.matchPassword(
                value1: bloc.passwordController.text,
                value2: value ?? "",
                password: value ?? "",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
