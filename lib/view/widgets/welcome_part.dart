import 'package:cadeau/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class WelcomePart extends StatelessWidget {
  final String text1;
  final String text2;
  final bool withImage;
  const WelcomePart({
    super.key,
    this.withImage = false,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        withImage
            ? Column(
                children: [
                  SizedBox(height: 30),
                  Image.asset(AppImages.logo, height: 54, width: 158),
                ],
              )
            : SizedBox(),
        SizedBox(height: 25),

        Text(
          text1,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 21,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 6),
        Text(
          text2,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
