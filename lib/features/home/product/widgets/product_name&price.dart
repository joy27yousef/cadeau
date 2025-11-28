import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/widgets/love.dart';
import 'package:flutter/material.dart';

class ProductNamePrice extends StatelessWidget {
  const ProductNamePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'FlowerAura Decorative Bunch of 12 Red Live Fresh Roses Flowers Bouquet',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColor.secondBlack,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Love(),
              ],
            ),
            SizedBox(height: 10),

            Text(
              '600 \$',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColor.mainColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
