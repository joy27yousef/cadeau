import 'package:cadeau/view/screens/auth/login/widgets/login_bottom.dart';
import 'package:cadeau/view/screens/auth/login/widgets/login_inputs.dart';
import 'package:cadeau/view/widgets/welcome_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            WelcomePart(withImage: true, text1: '12'.tr, text2: '13'.tr),
            LoginInputs(),
            LoginBottom(),
          ],
        ),
      ),
    );
  }
}
