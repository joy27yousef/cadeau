import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/title_input.dart';
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
            TitleInput(
              text: 'Email Address'.tr,
              lable: 'email@gmail.com'.tr,
              keyboard: TextInputType.emailAddress,
              withSpace: false,
            ),
            TitleInput(
              text: 'Full Name'.tr,
              lable: 'Enter full name'.tr,
              keyboard: TextInputType.text,
              withSpace: false,
            ),
            TitleInput(
              text: 'Phone Number'.tr,
              lable: '+966',
              keyboard: TextInputType.phone,
              withSpace: false,
            ),
            TitleInput(
              text: 'Gender'.tr,
              lable: 'Select gender'.tr,
              keyboard: TextInputType.phone,
              withSpace: false,
            ),

            SizedBox(height: 30),
            BoxButtom(
              color: AppColor.mainColor,
              ontapfun: () {},
              text: 'Save Changes'.tr,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
