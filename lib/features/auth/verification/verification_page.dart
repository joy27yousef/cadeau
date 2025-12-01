import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';

import 'package:cadeau/features/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/welcome_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Verification'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomePart(
              text1: 'Verification'.tr,
              text2: 'Please enter verification code'.tr,
            ),
            ReInputs(
              text: 'Verification Code'.tr,
              lable: '4 4 4 9',
              keyboard: TextInputType.phone,
            ),
            BoxButtom(
              color: AppColor.mainColor,
              ontapfun: () {
                Get.toNamed(AppRoutes.resetpasswordPage);
              },
              text: 'Verify Code'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
