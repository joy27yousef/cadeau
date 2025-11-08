import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/view/widgets/title_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBrands extends StatelessWidget {
  const HomeBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(
          text: '75'.tr,
          viewAll: true,
          onTap: () {
            Get.toNamed(AppRoutes.allBrands);
          },
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) => Container(
              height: 65,
              width: 130,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: AssetImage(AppImages.ads),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
