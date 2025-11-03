import 'package:cadeau/view/screens/auth/signUp/widgets/signup_bottom.dart';
import 'package:cadeau/view/screens/auth/signUp/widgets/signup_inputs.dart';
import 'package:cadeau/view/widgets/welcome_part.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            WelcomePart(
              withImage: true,
              text1: 'Welcome Back,',
              text2: 'Welcome back to our store',
            ),
            SignupInputs(),
            SignupBottom(),
          ],
        ),
      ),
    );
  }
}
