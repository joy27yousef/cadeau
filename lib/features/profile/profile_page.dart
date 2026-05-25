import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/functions/confirmation_alert.dart';
import 'package:cadeau/core/functions/message.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/profile/bloc/logout_bloc.dart';
import 'package:cadeau/features/profile/bloc/logout_event.dart';
import 'package:cadeau/features/profile/bloc/logout_state.dart';
import 'package:cadeau/features/profile/data/repository/logout_repo.dart';
import 'package:cadeau/features/profile/history/history_profile_part.dart';
import 'package:cadeau/features/profile/widgets/profile_discount_part.dart';
import 'package:cadeau/features/profile/widgets/profile_list.dart';
import 'package:cadeau/features/profile/widgets/userWishlist.dart';
import 'package:cadeau/features/profile/widgets/user_image_name.dart';
import 'package:cadeau/features/profile/widgets/user_some_data.dart';
import 'package:cadeau/features/social_section/screens/widgets/friend_brand.dart';
import 'package:cadeau/features/social_section/screens/widgets/my_friends_part.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.settingsPage);
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(Iconsax.setting_2),
                  ),
                ],
              ),
            ),

            //--- user information ---
            UserImageName(
              image: AppImages.person,
              name: 'Joy Yousef',
              email: 'joyyousef5496@gmail.com',
            ),
            UserSomeData(),

            //--- user follow brands ---
            FriendBrand(),
            SizedBox(height: 10), //--- user wishlist ---
            TitleHome(
              text: 'Wishlist',
              viewAll: true,
              onTap: () {
                Get.toNamed(AppRoutes.wishlistPage);
              },
            ),
            Userwishlist(), SizedBox(height: 20),

            //--- user track discount ---
            ProfileDiscountPart(), const SizedBox(height: 30),

            //--- user track discount ---
            MyFriendsPart(),
            HistoryProfilePart(),

            // ProfileList(
            //   title: 'Edit Profile'.tr,
            //   icon: Iconsax.profile_circle,
            //   ontap: () {
            //     Get.toNamed(AppRoutes.editProfilePage);
            //   },
            // ),
            // ProfileList(
            //   title: 'Track Orders'.tr,
            //   icon: Iconsax.truck,
            //   ontap: () {
            //     final navController = Get.find<NavigationController>();
            //     navController.changeIndex(2);
            //   },
            // ),
            // ProfileList(
            //   title: 'Edit Payment Form'.tr,
            //   icon: Iconsax.money,
            //   ontap: () {
            //     Get.toNamed(AppRoutes.editPaymentPage);
            //   },
            // ),

            // ProfileList(
            //   title: 'Terms & Conditions'.tr,
            //   icon: FontAwesomeIcons.circleQuestion,
            //   ontap: () {},
            // ),
            // ProfileList(
            //   title: 'Reports & Help'.tr,
            //   icon: Iconsax.message_notif,
            //   ontap: () {
            //     Get.toNamed(AppRoutes.reportsHelpPage);
            //   },
            // ),
            BlocProvider<LogoutBloc>(
              create: (_) {
                return LogoutBloc(sl());
              },
              child: BlocConsumer<LogoutBloc, LogoutState>(
                listener: (context, state) {
                  if (state is LogoutSuccess) {
                    showMessage(
                      context,
                      message: state.model.message,
                      isSuccess: true,
                    );
                    Get.offAllNamed(AppRoutes.login);
                  } else if (state is LogoutFailure) {
                    showMessage(
                      context,
                      message: state.error,
                      isSuccess: false,
                    );
                  }
                },
                builder: (context, state) {
                  final bloc = context.read<LogoutBloc>();

                  bool isLoading = state is LogoutLoading;
                  return ProfileList(
                    title: 'Logout'.tr,
                    icon: Iconsax.logout,
                    ontap: () {
                      confirmationAelrt(
                        AppImages.logout,
                        'Are you sure you want to log out of the app ? '.tr,
                        'No, Cancel'.tr,
                        'Yes, Logout'.tr,
                        AppColor.mainColor,
                        isLoading,
                        () {
                          bloc.add(SubmitLogoutEvent());
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
