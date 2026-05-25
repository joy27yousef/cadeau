import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class TitleHome extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool viewAll;
  final bool withPadding;

  const TitleHome({
    super.key,
    required this.text,
    this.onTap,
    this.viewAll = false,
    this.withPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: withPadding
          ? const EdgeInsets.symmetric(horizontal: 20)
          : const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
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
                'View All'.tr,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColor.secondBlack,
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
