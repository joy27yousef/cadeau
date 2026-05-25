import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FriendBrand extends StatelessWidget {
  const FriendBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Followed Brands',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(fontSize: 18),
                  ),
                  Text(
                    'See All',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 14,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 85,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade200),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Iconsax.shop,
                              color: AppColor.mainColor,
                              size: 22,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Brand ${index + 1}',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 13,
                                color: AppColor.black,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
