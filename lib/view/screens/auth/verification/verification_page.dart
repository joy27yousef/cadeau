import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/view/screens/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:cadeau/view/widgets/welcome_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Verification'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomePart(
              text1: 'Verification',
              text2: 'Please enter verification code',
            ),
            ReInputs(
              text: 'Verification Code',
              lable: '4 4 4 9',
              keyboard: TextInputType.phone,
            ),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {
                Get.toNamed(AppRoutes.resetpasswordPage);
              },
              text: 'Verify Code',
            ),
          ],
        ),
      ),
    );
  }
}
