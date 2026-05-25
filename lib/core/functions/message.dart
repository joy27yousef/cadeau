import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMessage(
  BuildContext context, {
  required String message,
  bool isSuccess = true,
  bool isInfo = false,
  Duration duration = const Duration(seconds: 3),
}) {
  Color accentColor;
  Color backgroundColor;
  IconData icon; // سيتم تعيينها الآن في كل المسارات حتماً

  if (isInfo) {
    accentColor = const Color(0xFF2F80ED);
    backgroundColor = const Color(0xFFF0F6FF);
    icon = Icons.info_rounded;
  } else if (isSuccess) {
    accentColor = const Color(0xFF27AE60);
    backgroundColor = const Color(0xFFEEF9F1);
    icon = Icons.check_circle_rounded;
  } else {
    // حالة الخطأ (Error State) - تم إضافة الـ icon هنا لحل المشكلة
    accentColor = const Color(0xFFEB5757);
    backgroundColor = const Color(0xFFFFF2F2);
    icon = Icons.error_rounded; // <--- هنا تم الإصلاح
  }

  if (Get.isSnackbarOpen) {
    Get.closeCurrentSnackbar();
  }

  Get.rawSnackbar(
    messageText: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: accentColor, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color(0xFF2D3748),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    ),
    backgroundColor: backgroundColor,
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
    borderRadius: 20,
    duration: duration,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    snackPosition: SnackPosition.TOP,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.06),
        blurRadius: 15,
        offset: const Offset(0, 8),
      ),
    ],
  );
}
