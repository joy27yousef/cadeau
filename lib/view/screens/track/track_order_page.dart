import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/view/screens/track/order_dit.dart';
import 'package:cadeau/view/widgets/appbar_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax/iconsax.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarMainScreens(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Number: 512',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColor.secondBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  OrderDit(
                    title: '104'.tr,
                    text: 'Joy',
                    icon: Iconsax.profile_tick,
                  ),
                  OrderDit(
                    title: '105'.tr,
                    text: '15-05-2022',
                    icon: Iconsax.calendar_1,
                  ),
                  OrderDit(
                    title: '106',
                    text: 'Orde Canceled',
                    icon: Iconsax.status,
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey.shade300),
          ],
        ),
      ),
    );
  }
}
