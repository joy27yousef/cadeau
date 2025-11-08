import 'package:cadeau/core/localization/change_local.dart';
import 'package:cadeau/view/screens/profile/settings/widgets/showLang.dart';
import 'package:cadeau/view/screens/profile/widgets/profile_list.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: '112'.tr),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ProfileList(
              title: '108'.tr,
              icon: Iconsax.language_circle,
              isLang: true,
              ontap: () => showLang(context),
            ),
            ProfileList(
              title: '113'.tr,
              icon: Iconsax.password_check,
              ontap: () {},
            ),

            ProfileList(title: '109'.tr, icon: Iconsax.trash, ontap: () {}),
          ],
        ),
      ),
    );
  }
}
