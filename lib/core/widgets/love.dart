import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Love extends StatelessWidget {
  const Love({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 241, 215),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(Iconsax.heart5, color: AppColor.mainColor, size: 20),
    );
  }
}
