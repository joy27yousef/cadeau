import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  final String text1;
  final String text2;
  const Empty({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.empty, height: 180),
          const SizedBox(height: 10),
          Text(
            text1,

            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColor.secondBlack,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5),
          Text(
            text2,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColor.darkGray,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
