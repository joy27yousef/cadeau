import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/boxText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutBotoom extends StatelessWidget {
  const CheckoutBotoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Boxtext(
          color: AppColor.mainColor,
          ontapfun: () {
            Get.toNamed(AppRoutes.completeAymentPage);
          },
          text: 'Proceed Payment'.tr,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(
              'Do you want to send to another person? '.tr,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.darkGray,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              child: Text(
                'Click here'.tr,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColor.mainColor,
                  decorationThickness: 2,
                  fontSize: 13,
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
