import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/features/categories/screens/home_categories.dart';
import 'package:cadeau/features/brands/screen/home_brands.dart';
import 'package:cadeau/features/home/widgets/home_cadeau_box.dart';
import 'package:cadeau/features/occasions/screens/home_occasions.dart';
import 'package:cadeau/features/home/widgets/home_onlyforu.dart';
import 'package:cadeau/features/home/widgets/home_product_view.dart';
import 'package:cadeau/features/home/widgets/home_scroll_ads.dart';
import 'package:cadeau/features/home/widgets/home_search_part.dart';
import 'package:cadeau/features/main_page.dart';
import 'package:cadeau/features/product/screens/latest_product.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final NavigationController navController = Get.find();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Image.asset(AppImages.logo, width: 100),
        leading: InkWell(
          onTap: () => navController.openDrawer(),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.menu_rounded,
              color: AppColor.secondBlack,
              size: 25,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          HomeSearchPart(),
          HomeScrollAds(),
          HomeCategories(),
          HomeProductView(
            title: 'Top Seller'.tr,
            productTitle: 'Class Queen',
            price: '\$12.50',
            image: AppImages.ads,
          ),

          HomeOccasions(),
          HomeOnlyforu(),
          // LatestProduct(),
          HomeBrands(),
          HomeCadeauBox(withMargin: true),
        ],
      ),
    );
  }
}
