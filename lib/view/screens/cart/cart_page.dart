import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/view/screens/cart/widgets/cart_addsong.dart';
import 'package:cadeau/view/screens/cart/widgets/cart_product.dart';
import 'package:cadeau/view/screens/cart/widgets/cart_summary.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarMainScreens(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            CartProduct(),
            CartAddsong(),
            CartSummary(),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {},
              text: 'Proceed To Checkout',
            ),
          ],
        ),
      ),
    );
  }
}
