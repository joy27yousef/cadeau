import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class OrderDit extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;
  const OrderDit({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColor.mainColor, size: 20),
                SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColor.secondBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColor.secondBlack,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
