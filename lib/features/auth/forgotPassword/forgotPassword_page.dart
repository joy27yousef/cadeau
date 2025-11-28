
import 'package:cadeau/features/auth/forgotPassword/widgets/forgotpass_bottom.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/welcome_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotpasswordPage extends StatelessWidget {
  const ForgotpasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: '1'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomePart(
              text1: 'Forgot Password'.tr,
              text2: 'Please choose a method to reset your password..'.tr,
            ),
            ForgotpassBottom(),
          ],
        ),
      ),
    );
  }
}
