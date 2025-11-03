import 'package:cadeau/view/screens/auth/forgotPassword/widgets/forgotpass_bottom.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/leadingBack.dart';
import 'package:cadeau/view/widgets/welcome_part.dart';
import 'package:flutter/material.dart';

class ForgotpasswordPage extends StatelessWidget {
  const ForgotpasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Forgot Password'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomePart(
              text1: 'Forgot Password',
              text2: 'Please choose a method to reset your password..',
            ),
            ForgotpassBottom(),
          ],
        ),
      ),
    );
  }
}
