import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';

import 'package:cadeau/features/main_page.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/boxText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPay extends StatelessWidget {
  const SuccessPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Success'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Image.asset(AppImages.pay, width: 150),
                SizedBox(height: 30),
                Text(
                  'Your Order Has been Placed \nSuccessfully'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: AppColor.secondBlack,
                  ),
                ),
              ],
            ),
            SizedBox(height: 200),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {
                final navController = Get.find<NavigationController>();
                navController.changeIndex(0);
              },
              text: 'Continue Shopping'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
