import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/view/widgets/title_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProductView extends StatelessWidget {
  final String title;
  final String productTitle;
  final String price;
  final String image;
  final bool withall;
  const HomeProductView({
    super.key,
    required this.title,
    required this.productTitle,
    required this.price,
    required this.image,
    this.withall = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(text: title, viewAll: withall, onTap: () {}),
        SizedBox(height: 15),
        SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) => InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.productPage);
              },
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 208,
                width: 150,
                margin: EdgeInsets.only(right: 15),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),

                    Text(
                      productTitle,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      price,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColor.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
