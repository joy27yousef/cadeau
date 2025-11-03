import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/view/screens/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/view/screens/profile/reports%20&%20help/widgets/send_report_type.dart';
import 'package:cadeau/view/widgets/TextFormGen.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:flutter/material.dart';

class SendReportPage extends StatelessWidget {
  const SendReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Send Report'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReInputs(
              text: 'Email Address',
              lable: 'example@gmail.com',
              keyboard: TextInputType.emailAddress,
              withSpace: false,
            ),

            SizedBox(height: 20),
            Text('Report Type', style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: 10),
            SendReportType(),
            SizedBox(height: 20),
            Text('Message', style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: 10),
            TextFormGen(
              hint: '',
              lable: 'Enter Here....',
              typekey: TextInputType.text,
              isMessage: true,
            ),

            Spacer(),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {},
              text: 'Save Changes',
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
