import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cadeau/core/localization/change_local.dart';

void showLang(BuildContext context) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          Text(
            '114'.tr,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColor.secondBlack,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),

          ListTile(
            leading: Text("🇺🇸", style: TextStyle(fontSize: 24)),
            title: Text(
              "English",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              final localCtrl = Get.find<LocaleController>();
              localCtrl.changelang('en');
              Get.back();
            },
          ),

          ListTile(
            leading: Text("🇸🇦", style: TextStyle(fontSize: 24)),
            title: Text(
              "العربية",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              final localCtrl = Get.find<LocaleController>();
              localCtrl.changelang('ar');
              Get.back();
            },
          ),
        ],
      ),
    ),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    barrierColor: Colors.black.withOpacity(0.4),
    elevation: 10,
    enterBottomSheetDuration: const Duration(milliseconds: 400),
    exitBottomSheetDuration: const Duration(milliseconds: 250),
  );
}
