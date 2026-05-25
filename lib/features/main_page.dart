import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
import 'package:cadeau/features/cart/logic/bloc/cart_bloc.dart';
import 'package:cadeau/features/cart/screens/cart_page.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_bloc.dart';
import 'package:cadeau/features/home/home_page.dart';
import 'package:cadeau/features/latest_product/logic/bloc/Latest_product_bloc.dart';
import 'package:cadeau/features/latest_product/logic/bloc/Latest_product_event.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_bloc.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_event.dart';
import 'package:cadeau/features/only_for_you/logic/bloc/only_for_you_bloc.dart';
import 'package:cadeau/features/only_for_you/logic/bloc/only_for_you_event.dart';
import 'package:cadeau/features/order/track/logic/bloc/track_order_bloc.dart';
import 'package:cadeau/features/order/track/logic/bloc/track_order_event.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/profile/profile_page.dart';
import 'package:cadeau/features/social_section/screens/social_page.dart';
import 'package:cadeau/features/special_occasions/logic/bloc/special_occasions_bloc.dart';
import 'package:cadeau/features/special_occasions/logic/bloc/special_occasions_event.dart';
import 'package:cadeau/features/order/track/screens/track_order_page.dart';
import 'package:cadeau/core/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cadeau/core/constant/app_color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final NavigationController navController = Get.put(
    NavigationController(),
    permanent: true,
  );

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> pages = [
    HomePage(),
    SocialPage(),
    TrackOrderPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    navController.scaffoldKey = scaffoldKey;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<CategoriesBloc>()..add(LoadCategories()),
        ),
        BlocProvider(create: (_) => sl<ProductBloc>()..add(LoadAllProduct())),
        BlocProvider(create: (_) => sl<OccasionsBloc>()..add(LoadOccasions())),
        BlocProvider(
          create: (_) =>
              sl<SpecialOccasionsBloc>()..add(LoadSpecialOccasions()),
        ),
        BlocProvider(
          create: (_) => sl<LatestProductBloc>()..add(LoadLatestProduct()),
        ),
        BlocProvider(create: (_) => sl<BrandsBloc>()..add(LoadBrands())),
        BlocProvider(
          create: (_) => sl<OnlyForYouBloc>()..add(GetOnlyForYouDataEvent()),
        ),
        BlocProvider(create: (_) => sl<CartBloc>()..add(GetCartEvent())),
        BlocProvider(
          create: (_) => sl<TrackOrderBloc>()..add(LoadTrackOrder()),
        ),
      ],

      child: Obx(
        () => Scaffold(
          key: scaffoldKey,
          backgroundColor: AppColor.background,
          drawer: buildDrawer(context),
          body: pages[navController.selectedIndex.value],

          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColor.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  offset: const Offset(0, -3),
                  blurRadius: 40,
                ),
              ],
            ),
            child: SalomonBottomBar(
              currentIndex: navController.selectedIndex.value,
              onTap: navController.changeIndex,
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Iconsax.home),
                  title: Text("Home".tr),
                  selectedColor: AppColor.mainColor,
                  unselectedColor: AppColor.secondBlack,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Iconsax.gift),
                  title: Text("Friends"),
                  selectedColor: AppColor.mainColor,
                  unselectedColor: AppColor.secondBlack,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Iconsax.map_1),
                  title: Text("Track".tr),
                  selectedColor: AppColor.mainColor,
                  unselectedColor: AppColor.secondBlack,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Iconsax.shopping_bag),
                  title: Text("Cart".tr),
                  selectedColor: AppColor.mainColor,
                  unselectedColor: AppColor.secondBlack,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Iconsax.profile_circle),
                  title: Text("Profile".tr),
                  selectedColor: AppColor.mainColor,
                  unselectedColor: AppColor.secondBlack,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  GlobalKey<ScaffoldState>? scaffoldKey;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void openDrawer() {
    scaffoldKey?.currentState?.openDrawer();
  }
}
