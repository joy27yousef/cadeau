import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> features;

  const ProductDetails({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        Text(
          'Features'.tr,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: AppColor.secondBlack,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: features.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${entry.key}:  ',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 15,
                      color: AppColor.darkGray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      entry.value.toString(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey.shade900,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
