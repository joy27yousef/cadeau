import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class ProductInformation extends StatelessWidget {
  final String name;
  final String brand;
  final String description;
  final String price;
  final String productId;
  const ProductInformation({
    super.key,
    required this.name,
    required this.price,
    required this.productId,
    required this.brand,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    brand,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  '(3.5)',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColor.secondBlack,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '$price \$',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColor.secondBlack,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.grey.shade800,
                fontSize: 15,
                fontWeight: FontWeight.w300,
                wordSpacing: 3,
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
