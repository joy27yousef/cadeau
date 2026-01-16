import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMessage(
  BuildContext context, {
  required String message,
  bool isSuccess = true,
  bool isInfo = false,
  Duration duration = const Duration(seconds: 2),
}) {
  Color bg;

  IconData icon;

  if (isInfo) {
    bg = const Color(0xFF6BB6FF);
    icon = Icons.info_outline;
  } else if (isSuccess) {
    bg = const Color.fromARGB(255, 90, 206, 110);
    icon = Icons.check_circle_outline;
  } else {
    bg = const Color(0xFFFF7A7A);
    icon = Icons.error_outline;
  }

  Get.rawSnackbar(
    messageText: Text(
      message,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Colors.white,
        fontSize: 13.5,
        fontWeight: FontWeight.normal,
      ),
    ),
    backgroundColor: bg,
    icon: Icon(icon, color: Colors.white, size: 26),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    borderRadius: 25,
    duration: duration,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    snackPosition: SnackPosition.TOP,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
  );
}
