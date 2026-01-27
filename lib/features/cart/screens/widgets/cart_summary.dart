import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/features/cart/screens/widgets/summart_price.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        Text(
          'Summary'.tr,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColor.secondBlack,
          ),
        ),
        SizedBox(height: 20),
        SummartPrice(title: 'Products'.tr, price: '200 \$'),
        SummartPrice(title: 'Vat'.tr, price: '200 \$'),
        SummartPrice(title: 'Valet Number'.tr, price: '200 \$'),
        SummartPrice(title: 'Song'.tr, price: '200 \$'),
        SummartPrice(title: 'Total'.tr, price: '200 \$'),
        SizedBox(height: 10),
        Divider(color: Colors.grey.shade300),
        SizedBox(height: 10),
        SummartPrice(title: 'Total'.tr, price: '200 \$', istotal: true),
        SizedBox(height: 40),
      ],
    );
  }
}
