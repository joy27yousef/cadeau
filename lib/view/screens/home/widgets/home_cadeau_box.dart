import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class HomeCadeauBox extends StatelessWidget {
  const HomeCadeauBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '76'.tr,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColor.greyLight,
                ),
              ),
              SizedBox(height: 10),

              Text(
                '77'.tr,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColor.greyLight,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
