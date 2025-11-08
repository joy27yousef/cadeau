import 'package:cadeau/view/screens/cart/checkout/widgets/checkout_botoom.dart';
import 'package:cadeau/view/screens/cart/checkout/widgets/checkout_inputs.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: '36'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [CheckoutInputs(), CheckoutBotoom()]),
      ),
    );
  }
}
