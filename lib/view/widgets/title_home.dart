import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool viewAll;

  const TitleHome({
    super.key,
    required this.text,
    this.onTap,
    this.viewAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColor.secondBlack,
            fontSize: 18,
          ),
        ),

        if (viewAll)
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(15),
            child: Text(
              'View All',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColor.secondBlack,
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }
}
