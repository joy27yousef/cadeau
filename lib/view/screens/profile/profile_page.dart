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
              title: 'Wishlist',
              icon: Iconsax.heart,
              ontap: () {
                Get.toNamed(AppRoutes.wishlistPage);
              },
            ),
            ProfileList(
              title: 'Edit Profile',
              icon: Iconsax.profile_circle,
              ontap: () {
                Get.toNamed(AppRoutes.editProfilePage);
              },
            ),
            ProfileList(
              title: 'Track Orders',
              icon: Iconsax.truck,
              ontap: () {
                final navController = Get.find<NavigationController>();
                navController.changeIndex(2);
              },
            ),
            ProfileList(
              title: 'Edit Payment Form',
              icon: Iconsax.money,
              ontap: () {
                Get.toNamed(AppRoutes.editPaymentPage);
              },
            ),
            ProfileList(
              title: 'Terms & Conditions',
              icon: FontAwesomeIcons.circleQuestion,
              ontap: () {},
            ),
            ProfileList(
              title: 'Reports & Help',
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
