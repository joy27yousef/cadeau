import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_bloc.dart';
import 'package:cadeau/features/categories/screens/home_categories.dart';
import 'package:cadeau/features/brands/screen/home_brands.dart';
import 'package:cadeau/features/home/widgets/home_cadeau_box.dart';
import 'package:cadeau/features/only_for_you/screens/home_onlyfor_you.dart';
import 'package:cadeau/features/home/widgets/top_seller_product.dart';
import 'package:cadeau/features/home/widgets/home_scroll_ads.dart';
import 'package:cadeau/features/home/widgets/home_search_part.dart';
import 'package:cadeau/features/latest_product/logic/bloc/Latest_product_bloc.dart';
import 'package:cadeau/features/latest_product/logic/bloc/Latest_product_event.dart';
import 'package:cadeau/features/latest_product/screens/latest_product.dart';
import 'package:cadeau/features/main_page.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_bloc.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_event.dart';
import 'package:cadeau/features/occasions/screens/home_occasions.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/special_occasions/logic/bloc/special_occasions_bloc.dart';
import 'package:cadeau/features/special_occasions/logic/bloc/special_occasions_event.dart';
import 'package:cadeau/features/special_occasions/screens/home_special_occasions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  final NavigationController navController = Get.find();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColor.mainColor,
      backgroundColor: AppColor.background,
      onRefresh: () async {
        context.read<CategoriesBloc>().add(LoadCategories());
        context.read<ProductBloc>().add(LoadAllProduct());
        context.read<OccasionsBloc>().add(LoadOccasions());
        context.read<SpecialOccasionsBloc>().add(LoadSpecialOccasions());
        context.read<LatestProductBloc>().add(LoadLatestProduct());
        context.read<BrandsBloc>().add(LoadBrands());
        await Future.delayed(Duration(seconds: 2));
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () => Get.toNamed(AppRoutes.notificationsPage),
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Iconsax.notification,
                  color: AppColor.secondBlack,
                  size: 30,
                ),
              ),
            ),
          ],
          title: Image.asset(AppImages.logo, width: 130),
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
            TopSellerProduct(),
            HomeOccasions(),
            HomeSpecialOccasions(),
            LatestProduct(),
            HomeOnlyforu(),
            HomeBrands(),
            HomeCadeauBox(withMargin: true),
          ],
        ),
      ),
    );
  }
}
