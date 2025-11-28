import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/features/cart/widgets/cart_summary.dart';
import 'package:cadeau/core/widgets/boxText.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletePayBottom extends StatelessWidget {
  const CompletePayBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartSummary(),
        Boxtext(
          color: AppColor.mainColor,
          ontapfun: () {
            Get.toNamed(AppRoutes.successPay);
          },
          text: 'Pay'.tr,
        ),
      ],
    );
  }
}
