import 'package:cadeau/view/screens/cart/complete%20payment/widgets/complete_pay_bottom.dart';
import 'package:cadeau/view/screens/cart/complete%20payment/widgets/complete_product.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class CompleteAymentPage extends StatelessWidget {
  const CompleteAymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: '49'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [CompleteProduct(), CompletePayBottom()]),
      ),
    );
  }
}
