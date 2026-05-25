import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BrandNameAndDisc extends StatelessWidget {
  final String name;
  final String disc;
  const BrandNameAndDisc({super.key, required this.name, required this.disc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 22),
          ),
          SizedBox(height: 10),
          Text(
            disc,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: AppColor.secondBlack,
            ),
          ),
        ],
      ),
    );
  }
}
