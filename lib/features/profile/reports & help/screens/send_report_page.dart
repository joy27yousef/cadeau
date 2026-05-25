import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/core/widgets/title_input.dart';
import 'package:cadeau/features/profile/reports%20&%20help/data/repository/report_repo.dart';
import 'package:cadeau/features/profile/reports%20&%20help/logic/bloc/report_bloc.dart';
import 'package:cadeau/features/profile/reports%20&%20help/screens/widgets/send_report_type.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';

class SendReportPage extends StatelessWidget {
  const SendReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bolc = context.read<ReportBloc>();

    return Scaffold(
      appBar: AppbarScreens(title: 'Send Report'.tr),
      body: BlocProvider(
        create: (_) {
          return ReportBloc(sl());
        },

        child: Form(
          key: bolc.formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleInput(
                  text: 'Email Address'.tr,
                  lable: 'email@gmail.com'.tr,
                  keyboard: TextInputType.emailAddress,
                  withSpace: false,
                  mycontroller: bolc.emailController,
                ),

                SizedBox(height: 20),
                Text(
                  'Report Type'.tr,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 10),
                SendReportType(),
                SizedBox(height: 20),
                Text(
                  'Message'.tr,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 10),
                TextFormGen(
                  hint: '',
                  lable: 'Enter Here....'.tr,
                  typekey: TextInputType.text,
                  isMessage: true,
                  mycontroller: bolc.messageController,
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
        ),
      ),
    );
  }
}
