import 'package:cadeau/features/auth/login/screen/widgets/login_bottom.dart';
import 'package:cadeau/features/auth/login/screen/widgets/login_inputs.dart';
import 'package:cadeau/core/widgets/welcome_part.dart' show WelcomePart;
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
            WelcomePart(
              withImage: true,
              text1: 'Welcome Back,'.tr,
              text2: 'Welcome back to our store'.tr,
            ),
            LoginInputs(),
            LoginBottom(),
          ],
        ),
      ),
    );
  }
}
