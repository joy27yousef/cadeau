import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/data/apis/dio_consumer.dart';
import 'package:cadeau/core/functions/confirmation_alert.dart';
import 'package:cadeau/core/functions/message.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/features/main_page.dart';
import 'package:cadeau/features/profile/bloc/logout_bloc.dart';
import 'package:cadeau/features/profile/bloc/logout_event.dart';
import 'package:cadeau/features/profile/bloc/logout_state.dart';
import 'package:cadeau/features/profile/data/repository/logout_repo.dart';
import 'package:cadeau/features/profile/widgets/profile_list.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              title: 'Wishlist'.tr,
              icon: Iconsax.heart,
              ontap: () {
                Get.toNamed(AppRoutes.wishlistPage);
              },
            ),
            ProfileList(
              title: 'Edit Profile'.tr,
              icon: Iconsax.profile_circle,
              ontap: () {
                Get.toNamed(AppRoutes.editProfilePage);
              },
            ),
            ProfileList(
              title: 'Track Orders'.tr,
              icon: Iconsax.truck,
              ontap: () {
                final navController = Get.find<NavigationController>();
                navController.changeIndex(2);
              },
            ),
            ProfileList(
              title: 'Edit Payment Form'.tr,
              icon: Iconsax.money,
              ontap: () {
                Get.toNamed(AppRoutes.editPaymentPage);
              },
            ),
            ProfileList(
              title: 'Settings'.tr,
              icon: Iconsax.setting_2,
              ontap: () {
                Get.toNamed(AppRoutes.settingsPage);
              },
            ),
            ProfileList(
              title: 'Terms & Conditions'.tr,
              icon: FontAwesomeIcons.circleQuestion,
              ontap: () {},
            ),
            ProfileList(
              title: 'Reports & Help'.tr,
              icon: Iconsax.message_notif,
              ontap: () {
                Get.toNamed(AppRoutes.reportsHelpPage);
              },
            ),
            BlocProvider<LogoutBloc>(
              create: (_) {
                final repo = LogoutRepo(api: DioConsumer(dio: Dio()));
                return LogoutBloc(repo);
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
                      message: state.error.message,
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
                        'Are you sure you want to log out of the app ? ',
                        'No, Cancel',
                        'Yes, Logout',
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
