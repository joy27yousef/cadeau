import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/view/screens/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/view/screens/profile/reports%20&%20help/widgets/send_report_type.dart';
import 'package:cadeau/view/widgets/TextFormGen.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SendReportPage extends StatelessWidget {
  const SendReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: '96'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReInputs(
              text: '4'.tr,
              lable: '7'.tr,
              keyboard: TextInputType.emailAddress,
              withSpace: false,
            ),

            SizedBox(height: 20),
            Text('98'.tr, style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: 10),
            SendReportType(),
            SizedBox(height: 20),
            Text('47'.tr, style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: 10),
            TextFormGen(
              hint: '',
              lable: '99'.tr,
              typekey: TextInputType.text,
              isMessage: true,
            ),

            Spacer(),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {},
              text: '88'.tr,
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
