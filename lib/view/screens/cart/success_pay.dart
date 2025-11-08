import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/view/screens/main_page.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class SuccessPay extends StatelessWidget {
  const SuccessPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: '52'.tr),
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
                  '53'.tr,
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
              text: '54'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
