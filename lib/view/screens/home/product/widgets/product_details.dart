import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Details',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: AppColor.secondBlack,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.',

          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: AppColor.secondBlack,
            fontSize: 15,
            fontWeight: FontWeight.w300,
            height: 2,
            wordSpacing: 4,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
