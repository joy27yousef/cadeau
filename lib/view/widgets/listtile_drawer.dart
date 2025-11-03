import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class ListtileDrawer extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? ontap;
  const ListtileDrawer({
    super.key,
    required this.text,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => ontap,
      leading: Icon(icon, color: AppColor.mainColor, size: 20),
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: AppColor.secondBlack,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
  }
}
