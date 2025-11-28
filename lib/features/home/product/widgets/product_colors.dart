import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class ProductColors extends StatelessWidget {
  const ProductColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Colors'.tr,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: AppColor.secondBlack,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 30,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) => Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
