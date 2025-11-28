import 'package:cadeau/features/cart/complete%20payment/widgets/complete_pay_bottom.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import 'widgets/complete_product.dart';

class CompleteAymentPage extends StatelessWidget {
  const CompleteAymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Complete Payment'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [CompleteProduct(), CompletePayBottom()]),
      ),
    );
  }
}
