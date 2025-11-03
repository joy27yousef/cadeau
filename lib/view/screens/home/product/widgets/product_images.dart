import 'package:cadeau/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(AppImages.product),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 15),
        Text('data'),
        SizedBox(height: 15),
        SizedBox(
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, i) => Container(
              height: 65,
              width: 84,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey.shade200),
                image: DecorationImage(
                  image: AssetImage(AppImages.product),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
