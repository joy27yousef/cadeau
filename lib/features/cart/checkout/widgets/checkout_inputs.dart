import 'package:cadeau/core/constant/app_color.dart';

import 'package:cadeau/features/auth/forgotPassword/reset/widgets/re_inputs.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax/iconsax.dart';

class CheckoutInputs extends StatelessWidget {
  const CheckoutInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recipient Details'.tr,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        ReInputs(
          text: 'Name'.tr,
          lable: 'Enter Full Name'.tr,
          keyboard: TextInputType.text,
          withSpace: false,
        ),
        ReInputs(
          text: 'Phone Number'.tr,
          lable: '+966 256 485 1456',
          keyboard: TextInputType.phone,
          withSpace: false,
        ),
        SizedBox(height: 15),

        Text('Date'.tr, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 5),
        TextFormGen(
          hint: '',
          lable: '15-05-2022',
          typekey: TextInputType.datetime,
          iconform: Icon(Iconsax.calendar, color: AppColor.mainColor),
        ),
        SizedBox(height: 10),

        Row(
          children: [
            Icon(
              Icons.location_on_rounded,
              color: AppColor.mainColor,
              size: 15,
            ),
            SizedBox(width: 5),
            Text(
              'Set Point On Map'.tr,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColor.mainColor,
              ),
            ),
          ],
        ),
        ReInputs(
          text: 'Location'.tr,
          lable: 'Enter Location..'.tr,
          keyboard: TextInputType.text,
          withSpace: false,
        ),
        SizedBox(height: 15),

        Text('Message'.tr, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormGen(
          hint: '',
          lable: '(Optional)..'.tr,
          typekey: TextInputType.text,
          isMessage: true,
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
