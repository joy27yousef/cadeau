import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/view/screens/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Edit Profile Form'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ReInputs(
              text: 'Email Address',
              lable: 'example@gmail.com',
              keyboard: TextInputType.emailAddress,
              withSpace: false,
            ),
            ReInputs(
              text: 'Full Name',
              lable: 'Enter full name',
              keyboard: TextInputType.text,
              withSpace: false,
            ),
            ReInputs(
              text: 'Phone',
              lable: '+966',
              keyboard: TextInputType.phone,
              withSpace: false,
            ),
            ReInputs(
              text: 'Gender',
              lable: 'Select gender',
              keyboard: TextInputType.phone,
              withSpace: false,
            ),

            SizedBox(height: 30),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {},
              text: 'Save Changes',
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
