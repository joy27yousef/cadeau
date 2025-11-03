import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/product_allpage.dart';
import 'package:flutter/material.dart';

class AllOcassionPage extends StatelessWidget {
  const AllOcassionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Gifts for occasions'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Gifts for occasions',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: AppColor.secondBlack,
                ),
              ),
            ),
            SizedBox(height: 20),
            ProductAllpage(title: 'Birthday Gifts', image: AppImages.product),
          ],
        ),
      ),
    );
  }
}
