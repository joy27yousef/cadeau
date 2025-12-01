import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/features/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/features/profile/reports%20&%20help/widgets/send_report_type.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SendReportPage extends StatelessWidget {
  const SendReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Send Report'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReInputs(
              text: 'Email Address'.tr,
              lable: 'email@gmail.com'.tr,
              keyboard: TextInputType.emailAddress,
              withSpace: false,
            ),

            SizedBox(height: 20),
            Text(
              'Report Type'.tr,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10),
            SendReportType(),
            SizedBox(height: 20),
            Text('Message'.tr, style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: 10),
            TextFormGen(
              hint: '',
              lable: 'Enter Here....'.tr,
              typekey: TextInputType.text,
              isMessage: true,
            ),

            Spacer(),
            BoxButtom(
              color: AppColor.mainColor,
              ontapfun: () {},
              text: 'Save Changes'.tr,
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
