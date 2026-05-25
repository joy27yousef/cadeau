import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BrandNumbers extends StatelessWidget {
  final String numFoll;
  final String numProduct;
  const BrandNumbers({
    super.key,
    required this.numFoll,
    required this.numProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                numFoll,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColor.black,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'FOLLOWERS',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColor.black,
                  fontSize: 14,

                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                numProduct,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColor.black,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'PRODUCTS',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColor.black,
                  fontSize: 14,

                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
