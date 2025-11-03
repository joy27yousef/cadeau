import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() ontap;

  const ProfileList({
    super.key,
    required this.title,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
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
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColor.secondBlack,
        size: 17,
      ),
    );
  }
}
