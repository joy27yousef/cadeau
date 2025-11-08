import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotpassBottom extends StatelessWidget {
  const ForgotpassBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Get.toNamed(AppRoutes.resetpassPhonePage),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Color(0xFFDBDDDD)),
                ),
                child: Center(
                  child: Text(
                    '3'.tr,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed(AppRoutes.resetpassEmailPage),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromARGB(255, 253, 245, 232),
                ),
                child: Center(
                  child: Text(
                    '4'.tr,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColor.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
