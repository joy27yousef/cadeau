import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:cadeau/view/widgets/product_allpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AllOcassionPage extends StatelessWidget {
  const AllOcassionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: '66'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Center(
              child: Text(
                '66'.tr,
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
