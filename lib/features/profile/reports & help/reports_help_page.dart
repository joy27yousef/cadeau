import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/features/profile/widgets/profile_list.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportsHelpPage extends StatelessWidget {
  const ReportsHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Reports & Help'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            ProfileList(
              title: 'Send Report'.tr,
              icon: Icons.headset_mic_rounded,
              ontap: () {
                Get.toNamed(AppRoutes.sendReportPage);
              },
            ),
            ProfileList(
              title: 'Reports'.tr,
              icon: Icons.report_gmailerrorred_rounded,
              ontap: () {},
            ),
            ProfileList(
              title: 'Help'.tr,
              icon: Icons.help_outline_sharp,
              ontap: () {
                Get.toNamed(AppRoutes.helpPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
