import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool?> confirmationAelrt(
  String image,
  String content,
  String cancel,
  String confirmation,
  Color color,
  bool isLoading,
  Function()? onTap,
) {
  return Get.defaultDialog<bool>(
    backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
    title: '',
    titlePadding: EdgeInsets.zero,
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),

    content: StatefulBuilder(
      builder: (context, setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, height: 90),

            const SizedBox(height: 50),

            Text(
              content,
              textAlign: TextAlign.center,
              style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: AppColor.secondBlack,
              ),
            ),

            const SizedBox(height: 30),

            /// DELETE BUTTON
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () async {
                  setState(() => isLoading = true);

                  await onTap?.call();

                  Get.back(result: true); // ✅ يسمح بالحذف
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Center(
                    child: Text(
                      isLoading ? "Loading.." : confirmation,
                      style: Theme.of(Get.context!).textTheme.titleLarge!
                          .copyWith(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),

            /// CANCEL
            InkWell(
              onTap: () => Get.back(result: false),
              child: Text(
                cancel,
                style: Theme.of(
                  Get.context!,
                ).textTheme.titleMedium!.copyWith(color: color, fontSize: 15),
              ),
            ),
          ],
        );
      },
    ),
  );
}
