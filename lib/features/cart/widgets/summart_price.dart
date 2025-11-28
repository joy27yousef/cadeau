import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class SummartPrice extends StatelessWidget {
  final String title;
  final String price;
  final bool istotal;
  const SummartPrice({
    super.key,
    required this.title,
    required this.price,
    this.istotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: istotal
                  ? Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.secondBlack,
                      fontSize: 16,
                    )
                  : Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColor.secondBlack,
                      fontSize: 14,
                    ),
            ),
            Text(
              price,
              style: istotal
                  ? Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.secondBlack,
                      fontSize: 16,
                    )
                  : Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColor.secondBlack,
                      fontSize: 14,
                    ),
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
