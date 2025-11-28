import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SendReportType extends StatelessWidget {
  const SendReportType({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 35,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: Text(
              'Delivery'.tr,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 35,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: Text(
              'Finance'.tr,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),

        Container(
          height: 35,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: Text(
              'Other'.tr,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
