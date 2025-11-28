import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/features/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/boxText.dart';
import 'package:cadeau/core/widgets/welcome_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetpassPhonePage extends StatelessWidget {
  const ResetpassPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Forgot Password'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomePart(text1: 'Reset With Phone Number'.tr, text2: 'Please enter your phone number to get a verification code..'.tr),
            ReInputs(
              text: 'Phone Number'.tr,
              lable: '+963',
              keyboard: TextInputType.phone,
            ),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {
                Get.toNamed(AppRoutes.verificationPage);
              },
              text: 'Next'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
