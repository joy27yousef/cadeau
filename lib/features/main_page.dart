import 'package:cadeau/features/cart/screens/cart_page.dart';
import 'package:cadeau/features/home/home_page.dart';
import 'package:cadeau/features/profile/profile_page.dart';
import 'package:cadeau/features/track/track_order_page.dart';
import 'package:cadeau/core/widgets/main_drawer.dart';
import 'package:cadeau/features/wishlist/screens/wishlist_page.dart';
import 'package:flutter/material.dart';
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
    WishlistPage(),
    TrackOrderPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    navController.scaffoldKey = scaffoldKey;

    return Obx(
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
              /// Home
              SalomonBottomBarItem(
                icon: const Icon(Iconsax.home), 
                title: const Text("Home"),
                selectedColor: AppColor.mainColor,
                unselectedColor: AppColor.secondBlack,
              ),

              /// WishList
              SalomonBottomBarItem(
                icon: const Icon(Iconsax.gift),
                title: const Text("WishList"),
                selectedColor: AppColor.mainColor,
                unselectedColor: AppColor.secondBlack,
              ),

              /// Track
              SalomonBottomBarItem(
                icon: const Icon(Iconsax.map_1),
                title: const Text("Track"),
                selectedColor: AppColor.mainColor,
                unselectedColor: AppColor.secondBlack,
              ),

              /// Cart
              SalomonBottomBarItem(
                icon: const Icon(Iconsax.shopping_bag),
                title: const Text("Cart"),
                selectedColor: AppColor.mainColor,
                unselectedColor: AppColor.secondBlack,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: const Icon(Iconsax.profile_circle),
                title: const Text("Profile"),
                selectedColor: AppColor.mainColor,
                unselectedColor: AppColor.secondBlack,
              ),
            ],
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
