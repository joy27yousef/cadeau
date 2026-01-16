import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/title_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class EditPaymentPage extends StatelessWidget {
  const EditPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Edit Payment Form'.tr),
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
              text: 'Street'.tr,
              lable: '',
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
              text: 'State'.tr,
              lable: '',
              keyboard: TextInputType.text,
              withSpace: false,
            ),
            TitleInput(
              text: 'Postal Code'.tr,
              withSpace: false,
              lable: '',
              keyboard: TextInputType.text,
            ),
            TitleInput(
              text: 'Name'.tr,
              withSpace: false,
              lable: '86'.tr,
              keyboard: TextInputType.text,
            ),
            TitleInput(
              text: 'Surname'.tr,
              withSpace: false,
              lable: 'John'.tr,
              keyboard: TextInputType.text,
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
