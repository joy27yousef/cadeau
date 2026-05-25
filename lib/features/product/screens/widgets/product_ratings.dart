import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductRatings extends StatelessWidget {
  final List ratings;
  final String productId;

  const ProductRatings({
    super.key,
    required this.ratings,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    final ratingsCount = (ratings.length <= 3) ? ratings.length : 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(
          text: 'product reviews'.tr,
          viewAll: true,
          onTap: () {
            Get.toNamed(
              AppRoutes.allRatingPage,
              arguments: {'productId': productId},
            );
          },
          withPadding: false,
        ),
        SizedBox(height: 18),
        ...List.generate(
          ratingsCount,
          (i) => Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(6),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ratings[i].userName,
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(fontSize: 16),
                    ),
                    Row(
                      children: [
                        Icon(Iconsax.star1, color: Colors.amber),
                        SizedBox(width: 2),
                        Text(
                          "${ratings[i].rating}",
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  ratings[i].review ?? '',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
