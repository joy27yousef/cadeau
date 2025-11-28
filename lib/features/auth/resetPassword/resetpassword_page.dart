import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/features/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/boxText.dart';
import 'package:cadeau/core/widgets/welcome_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetpasswordPage extends StatelessWidget {
  const ResetpasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Reset Password'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomePart(
              text1: 'Set New Password'.tr,
              text2: 'Please enter your new password'.tr,
            ),
            ReInputs(
              text: 'Password'.tr,
              lable: '********',
              keyboard: TextInputType.text,
            ),
            ReInputs(
              text: 'Confirm Password'.tr,
              lable: '********',
              keyboard: TextInputType.text,
            ),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {
                Get.toNamed(AppRoutes.login);
              },
              text: 'Set New Password'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
