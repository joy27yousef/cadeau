
import 'package:cadeau/features/search/screens/widgets/product_price_list.dart';
import 'package:cadeau/features/search/screens/widgets/search_input.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SaerchPage extends StatelessWidget {
  const SaerchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Search'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [SearchInput(), SizedBox(height: 30), ProductPriceList()],
        ),
      ),
    );
  }
}
