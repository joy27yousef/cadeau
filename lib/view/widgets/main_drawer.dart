import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/view/screens/main_page.dart';
import 'package:cadeau/view/widgets/listtile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: AppColor.background,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 60),
        Center(child: Image.asset(AppImages.logo, width: 180)),
        const SizedBox(height: 50),

        ListtileDrawer(
          text: '100'.tr,
          icon: Iconsax.heart,
          ontap: () {
            Get.back();
            Future.delayed(const Duration(milliseconds: 200), () {
              Get.toNamed(AppRoutes.wishlistPage);
            });
          },
        ),

        ListtileDrawer(
          text: '102'.tr,
          icon: Iconsax.truck,
          ontap: () {
            Get.back();
            Future.delayed(const Duration(milliseconds: 200), () {
              final navController = Get.find<NavigationController>();
              navController.changeIndex(2);
            });
          },
        ),

        ListtileDrawer(
          text: '107'.tr,
          icon: Iconsax.shopping_bag,
          ontap: () {
            Get.back();
            Future.delayed(const Duration(milliseconds: 200), () {
              final navController = Get.find<NavigationController>();
              navController.changeIndex(3);
            });
          },
        ),

        ListtileDrawer(
          text: '96'.tr,
          icon: Iconsax.message_circle,
          ontap: () {
            Get.back();
            Future.delayed(const Duration(milliseconds: 200), () {
              Get.toNamed(AppRoutes.sendReportPage);
            });
          },
        ),

        ListtileDrawer(text: '103'.tr, icon: FontAwesomeIcons.circleQuestion),
        ListtileDrawer(
          text: '112'.tr,
          icon: Iconsax.setting_2,
          ontap: () {
            Get.toNamed(AppRoutes.settingsPage);
          },
        ),

        ListTile(
          leading: Icon(Iconsax.logout, size: 20, color: AppColor.mainColor),
          title: Text(
            '110'.tr,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColor.mainColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
