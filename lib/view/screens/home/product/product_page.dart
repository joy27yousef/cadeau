import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/view/screens/home/product/widgets/product_colors.dart';
import 'package:cadeau/view/screens/home/product/widgets/product_details.dart';
import 'package:cadeau/view/screens/home/product/widgets/product_images.dart';
import 'package:cadeau/view/screens/home/product/widgets/product_name&price.dart';
import 'package:cadeau/view/screens/home/widgets/home_cadeau_box.dart';
import 'package:cadeau/view/screens/home/widgets/home_product_view.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:cadeau/view/widgets/leadingBack.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Leadingback(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Brand Name',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ProductImages(),
            ProductNamePrice(),
            ProductDetails(),
            ProductColors(),
            Boxtext(
              color: AppColor.mainColor,
              ontapfun: () {},
              text: 'Add To Cart',
            ),
            SizedBox(height: 30),
            HomeProductView(
              title: 'Similar Products',
              productTitle: 'Class Queen',
              price: '\$12.50',
              image: AppImages.ads,
              withall: false,
            ),
            HomeCadeauBox(),
          ],
        ),
      ),
    );
  }
}
