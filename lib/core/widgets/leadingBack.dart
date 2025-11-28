import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Leadingback extends StatelessWidget {
  const Leadingback({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      borderRadius: BorderRadius.circular(20),
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColor.secondBlack,
        size: 18,
      ),
    );
  }
}
