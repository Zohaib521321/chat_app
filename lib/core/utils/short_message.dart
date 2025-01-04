import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class ShortMessageUtils {
  static Future<void> showSuccess(String message) async {
    await Future.delayed(const Duration(milliseconds: 50));

    Get.snackbar(
      '',
      message,
      icon: Icon(Icons.check_circle_outline, color: AppColors.backgroundColor),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      animationDuration: const Duration(milliseconds: 800),
      snackStyle: SnackStyle.FLOATING,
      boxShadows: [
        const BoxShadow(
          color: Colors.black45,
          offset: Offset(0, 2),
          blurRadius: 6,
        ),
      ],
      titleText: Text(
        'Success!',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  static Future<void> showError(String message) async {
    await Future.delayed(const Duration(milliseconds: 50));

    Get.snackbar(
      '',
      message,
      icon: const Icon(Icons.error_outline, color: AppColors.backgroundColor),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.errorColor,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInCirc,
      animationDuration: const Duration(milliseconds: 800),
      snackStyle: SnackStyle.FLOATING,
      boxShadows: [
        const BoxShadow(
          color: Colors.black45,
          offset: Offset(0, 2),
          blurRadius: 6,
        ),
      ],
      titleText: Text(
        'Error!',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
