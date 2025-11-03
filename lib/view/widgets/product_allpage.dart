import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class ProductAllpage extends StatelessWidget {
  final String title;
  final String image;
  const ProductAllpage({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 17,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, i) => Column(
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColor.secondBlack,
            ),
          ),
        ],
      ),
    );
  }
}
