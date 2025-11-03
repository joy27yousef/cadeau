import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:cadeau/view/widgets/leadingBack.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppbarScreens extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppbarScreens({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Leadingback(),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title, style: Theme.of(context).appBarTheme.titleTextStyle),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppbarMainScreens extends StatelessWidget implements PreferredSizeWidget {
  const AppbarMainScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leadingWidth: 150,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Image.asset(AppImages.logo, width: 50),
      ),
      actions: [
        InkWell(
          onTap: () => Get.toNamed(AppRoutes.wishlistPage),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Iconsax.heart, color: AppColor.secondBlack),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
