import 'package:cadeau/core/localization/change_local.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/view/screens/main_page.dart';
import 'package:cadeau/view/screens/profile/widgets/profile_list.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarMainScreens(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Column(
          children: [
            ProfileList(
              title: '100'.tr,
              icon: Iconsax.heart,
              ontap: () {
                Get.toNamed(AppRoutes.wishlistPage);
              },
            ),
            ProfileList(
              title: '101'.tr,
              icon: Iconsax.profile_circle,
              ontap: () {
                Get.toNamed(AppRoutes.editProfilePage);
              },
            ),
            ProfileList(
              title: '102'.tr,
              icon: Iconsax.truck,
              ontap: () {
                final navController = Get.find<NavigationController>();
                navController.changeIndex(2);
              },
            ),
            ProfileList(
              title: '82'.tr,
              icon: Iconsax.money,
              ontap: () {
                Get.toNamed(AppRoutes.editPaymentPage);
              },
            ),
            ProfileList(
              title: '112'.tr,
              icon: Iconsax.setting_2,
              ontap: () {
                Get.toNamed(AppRoutes.settingsPage);
              },
            ),
            ProfileList(
              title: '103'.tr,
              icon: FontAwesomeIcons.circleQuestion,
              ontap: () {},
            ),
            ProfileList(
              title: '95'.tr,
              icon: Iconsax.message_notif,
              ontap: () {
                Get.toNamed(AppRoutes.reportsHelpPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
