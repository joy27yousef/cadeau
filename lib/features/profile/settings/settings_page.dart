
import 'package:cadeau/features/profile/settings/widgets/showLang.dart';
import 'package:cadeau/features/profile/widgets/profile_list.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Settings'.tr),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ProfileList(
              title: 'Language'.tr,
              icon: Iconsax.language_circle,
              isLang: true,
              ontap: () => showLang(context),
            ),
            ProfileList(
              title: 'Change Password'.tr,
              icon: Iconsax.password_check,
              ontap: () {},
            ),

            ProfileList(title: 'Delete Account'.tr, icon: Iconsax.trash, ontap: () {}),
          ],
        ),
      ),
    );
  }
}
