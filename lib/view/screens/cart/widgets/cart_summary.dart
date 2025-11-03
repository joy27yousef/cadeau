import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/view/screens/cart/widgets/summart_price.dart';
import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        Text(
          'Summary',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColor.secondBlack,
          ),
        ),
        SizedBox(height: 20),
        SummartPrice(title: 'Products', price: '200 \$'),
        SummartPrice(title: 'Vat', price: '200 \$'),
        SummartPrice(title: 'Valet Number', price: '200 \$'),
        SummartPrice(title: 'Song', price: '200 \$'),
        SummartPrice(title: 'Total', price: '200 \$'),
        SizedBox(height: 10),
        Divider(color: Colors.grey.shade300),
        SizedBox(height: 10),
        SummartPrice(title: 'Total', price: '200 \$', istotal: true),
        SizedBox(height: 40),
      ],
    );
  }
}
