import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/love.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarMainScreens(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, i) => Container(
            height: 100,
            padding: EdgeInsets.only(bottom: 20),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          image: AssetImage(AppImages.product),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Class Queen',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 15,
                                color: AppColor.secondBlack,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Text(
                          'Brand: Class One',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 13,
                                color: AppColor.secondBlack,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        Text(
                          '\$12.50',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 16,
                                color: AppColor.mainColor,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                Love(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
