import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMessage({
  required String message,
  bool isSuccess = true,
  Duration duration = const Duration(seconds: 3),
}) {
  Get.snackbar(
    isSuccess ? 'Success' : 'Error',
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.grey.withOpacity(0.85),
    colorText: Colors.white,
    margin: const EdgeInsets.all(8),
    borderRadius: 15,
    duration: duration,
    icon: Icon(
      isSuccess ? Icons.check_circle_outline : Icons.error_outline,
      color: isSuccess ? Colors.green : Colors.red,
    ),
    shouldIconPulse: true,
    overlayBlur: 1,
  );
}
