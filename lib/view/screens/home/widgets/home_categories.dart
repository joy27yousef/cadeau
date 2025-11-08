import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/view/widgets/title_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:iconsax/iconsax.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(text: '78'.tr, viewAll: true, onTap: () {}),
        SizedBox(height: 15),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Icon(
                        Iconsax.cake,
                        size: 30,
                        color: AppColor.secondBlack,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Glasses',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
