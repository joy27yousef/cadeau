import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/view/screens/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class EditPaymentPage extends StatelessWidget {
  const EditPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: '82'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ReInputs(
              text: '4'.tr,
              lable: '7'.tr,
              keyboard: TextInputType.emailAddress,
              withSpace: false,
            ),
            ReInputs(
              text: '83'.tr,
              lable: '',
              keyboard: TextInputType.text,
              withSpace: false,
            ),
            ReInputs(
              text: '3'.tr,
              lable: '+966',
              keyboard: TextInputType.phone,
              withSpace: false,
            ),
            ReInputs(
              text: '84'.tr,
              lable: '',
              keyboard: TextInputType.text,
              withSpace: false,
            ),
            ReInputs(
              text: '85'.tr,
              withSpace: false,
              lable: '',
              keyboard: TextInputType.text,
            ),
            ReInputs(
              text: '41'.tr,
              withSpace: false,
              lable: '86'.tr,
              keyboard: TextInputType.text,
            ),
            ReInputs(
              text: '87'.tr,
              withSpace: false,
              lable: '86'.tr,
              keyboard: TextInputType.text,
            ),
            SizedBox(height: 30),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {},
              text: '88'.tr,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
