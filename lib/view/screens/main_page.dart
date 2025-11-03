import 'package:cadeau/view/screens/cart/cart_page.dart';
import 'package:cadeau/view/screens/categories/categories_page.dart';
import 'package:cadeau/view/screens/home/home_page.dart';
import 'package:cadeau/view/screens/profile/profile_page.dart';
import 'package:cadeau/view/screens/track/track_order_page.dart';
import 'package:cadeau/view/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cadeau/core/constant/app_color.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final NavigationController navController = Get.put(
    NavigationController(),
    permanent: true,
  );
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> pages = [
    HomePage(),
    CategoriesPage(),
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
                blurRadius: 20,
                spreadRadius: 10,
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: navController.selectedIndex.value,
            onTap: navController.changeIndex,
            backgroundColor: AppColor.background,
            selectedItemColor: AppColor.mainColor,
            unselectedItemColor: AppColor.secondBlack,
            iconSize: 22,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            enableFeedback: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Iconsax.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Iconsax.gift), label: ""),
              BottomNavigationBarItem(icon: Icon(Iconsax.map_1), label: ""),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.shopping_bag),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.profile_circle),
                label: "",
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
