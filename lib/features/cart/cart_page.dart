import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/features/cart/widgets/cart_addsong.dart';
import 'package:cadeau/features/cart/widgets/cart_product.dart';
import 'package:cadeau/features/cart/widgets/cart_summary.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarMainScreens(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
        child: ListView(
          children: [
            CartProduct(),
            CartAddsong(),
            CartSummary(),
            BoxButtom(
              color: AppColor.mainColor,
              ontapfun: () {
                Get.toNamed(AppRoutes.checkoutPage);
              },
              text: 'Proceed To Checkout'.tr,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
