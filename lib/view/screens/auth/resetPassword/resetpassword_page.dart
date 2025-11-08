import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/view/screens/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:cadeau/view/widgets/welcome_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetpasswordPage extends StatelessWidget {
  const ResetpasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: '22'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomePart(text1: '23'.tr, text2: '24'.tr),
            ReInputs(
              text: '21'.tr,
              lable: '********',
              keyboard: TextInputType.text,
            ),
            ReInputs(
              text: '25'.tr,
              lable: '********',
              keyboard: TextInputType.text,
            ),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {
                Get.toNamed(AppRoutes.login);
              },
              text: '23'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
