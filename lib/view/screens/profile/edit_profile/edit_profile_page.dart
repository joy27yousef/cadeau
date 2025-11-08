import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/view/screens/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
              text: '4'.tr,
              lable: '7'.tr,
              keyboard: TextInputType.emailAddress,
              withSpace: false,
            ),
            ReInputs(
              text: '29'.tr,
              lable: '30'.tr,
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
              text: '31'.tr,
              lable: '89'.tr,
              keyboard: TextInputType.phone,
              withSpace: false,
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
