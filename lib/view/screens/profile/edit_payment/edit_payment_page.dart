import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/view/screens/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:flutter/material.dart';

class EditPaymentPage extends StatelessWidget {
  const EditPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Edit Payment Form'),
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
              text: 'Street',
              lable: '',
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
              text: 'State',
              lable: '',
              keyboard: TextInputType.text,
              withSpace: false,
            ),
            ReInputs(
              text: 'Postal Code',
              withSpace: false,
              lable: '',
              keyboard: TextInputType.text,
            ),
            ReInputs(
              text: 'Name',
              withSpace: false,
              lable: 'John',
              keyboard: TextInputType.text,
            ),
            ReInputs(
              text: 'Surname',
              withSpace: false,
              lable: 'json',
              keyboard: TextInputType.text,
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
