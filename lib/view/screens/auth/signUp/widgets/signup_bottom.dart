import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupBottom extends StatelessWidget {
  const SignupBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Boxtext(color: AppColor.mainColor, ontapfun: () {}, text: '26'.tr),
        SizedBox(height: 18),
        Row(
          children: [
            Text(
              '27'.tr,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.darkGray,
                fontWeight: FontWeight.w400,
              ),
            ),
            InkWell(
              onTap: () => Get.offNamed(AppRoutes.login),
              borderRadius: BorderRadius.circular(20),
              child: Text(
                '28'.tr,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColor.mainColor,
                  decorationThickness: 2,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
