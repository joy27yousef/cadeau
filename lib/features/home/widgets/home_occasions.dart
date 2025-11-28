import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeOccasions extends StatelessWidget {
  const HomeOccasions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(
          text: 'Special Occasions'.tr,
          viewAll: true,
          onTap: () {
            Get.toNamed(AppRoutes.allOcassionPage);
          },
        ),
        SizedBox(height: 15),
        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(horizontal: 20),

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.ads),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 10),

        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(horizontal: 20),

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.ads),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 10),

        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(horizontal: 20),

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.ads),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
