import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(AppImages.product),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Class Queen',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColor.secondBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Price: \$12.50',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColor.secondBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Total: \$12.50',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColor.secondBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 230, 211),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Icon(Icons.add, size: 25, color: AppColor.mainColor),
                ),
              ),
              SizedBox(width: 8),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Icon(Iconsax.trash, size: 20, color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
