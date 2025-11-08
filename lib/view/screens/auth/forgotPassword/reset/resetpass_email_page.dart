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
      appBar: AppbarScreens(title: '1'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomePart(text1: '5'.tr, text2: '6'.tr),
            ReInputs(
              text: '4'.tr,
              lable: '7'.tr,
              keyboard: TextInputType.emailAddress,
            ),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {
                Get.toNamed(AppRoutes.verificationPage);
              },
              text: '8'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
