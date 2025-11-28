import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class ProductPriceList extends StatelessWidget {
  const ProductPriceList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: AssetImage(AppImages.product),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'title',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColor.secondBlack,
            ),
          ),
          SizedBox(height: 5),

          Text(
            '\$12.50',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColor.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
