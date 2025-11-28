import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Help'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            ListTile(
              leading: Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
              title: Text(
                'Whatsapp'.tr,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColor.secondBlack,
                ),
              ),
              subtitle: Text(
                '+966132658498',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColor.secondBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
