import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/view/screens/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:cadeau/view/widgets/welcome_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetpassEmailPage extends StatelessWidget {
  const ResetpassEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Forgot Password'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomePart(
              text1: 'Reset With Email Address',
              text2:
                  'Please enter your email address to get a verifiication code..',
            ),
            ReInputs(
              text: 'Email Address',
              lable: 'email@gmail.com',
              keyboard: TextInputType.emailAddress,
            ),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {
                Get.toNamed(AppRoutes.verificationPage);
              },
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
