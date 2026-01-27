import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CartAddsong extends StatelessWidget {
  const CartAddsong({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        Divider(color: Colors.grey.shade300),
        SizedBox(height: 30),
        Text(
          'Add Song Link:'.tr,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 10),

        TextFormGen(
          hint: '',
          lable: 'https://youtube.com',
          typekey: TextInputType.text,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(Icons.add_circle_outline_sharp, color: AppColor.mainColor),
            SizedBox(width: 5),
            Text(
              'Add Song'.tr,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColor.mainColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Container(
          height: 35,
          padding: EdgeInsets.symmetric(horizontal: 13),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 245, 227),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Icon(Icons.warning_rounded, color: AppColor.mainColor),
              SizedBox(width: 5),
              Text(
                'The price doesn’t include the shipping charge'.tr,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 12,
                  color: AppColor.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
