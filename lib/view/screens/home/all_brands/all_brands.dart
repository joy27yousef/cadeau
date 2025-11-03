import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';

import 'package:cadeau/view/widgets/product_allpage.dart';
import 'package:flutter/material.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Brands'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 20),
            ProductAllpage(title: 'Moog Optical', image: AppImages.product),
          ],
        ),
      ),
    );
  }
}
