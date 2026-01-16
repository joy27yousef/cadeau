import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/features/auth/verificationAccount/logic/bloc/verification_account_bloc.dart'; // تأكد من استيراد البلوك
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationAccountInput extends StatelessWidget {
  const VerificationAccountInput({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VerificationAccountBloc>();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(18),
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
            const SizedBox(height: 50),
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
          ],
        ),
      ),
    );
  }
}
