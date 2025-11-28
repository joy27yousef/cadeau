import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class HomeScrollAds extends StatelessWidget {
  const HomeScrollAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
              color: AppColor.mainColor,
              image: DecorationImage(
                image: AssetImage(AppImages.ads),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 15),

          SizedBox(height: 15),
        ],
      ),
    );
  }
}
