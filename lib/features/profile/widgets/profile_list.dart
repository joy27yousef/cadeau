import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/localization/change_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show Get, Inst;

class ProfileList extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() ontap;
  final bool isLang;

  const ProfileList({
    super.key,
    required this.title,
    required this.icon,
    required this.ontap,
    this.isLang = false,
  });

  @override
  Widget build(BuildContext context) {
    final localCtrl = Get.find<LocaleController>();
    return ListTile(
      onTap: ontap,

      leading: Icon(icon, color: AppColor.mainColor),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppColor.black,
        ),
      ),

      trailing: isLang
          ? Text(
              localCtrl.language.value.languageCode == 'ar' ? 'Ar' : 'En',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.mainColor,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            )
          : Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColor.secondBlack,
              size: 17,
            ),
    );
  }
}
