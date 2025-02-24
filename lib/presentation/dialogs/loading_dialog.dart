import 'package:chat_app/core/constants/app_size.dart';
import 'package:chat_app/presentation/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';

class LoadingDialog {
  ///[show] dialogue
  static void show({String message = "Please wait..."}) {
    Get.dialog(
      PopScope(
        canPop: false,
        child: Center(
          child: Container(
            width: AppSize.getHeight(15),
            height: AppSize.getHeight(14),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                ),
                SizedBox(height: 12),
                TextWidget(
                  title: message,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  ///[dismiss] dialogue
  static void dismiss() {
    if (Get.isDialogOpen ?? false) {
      Get.back(); // Close the dialog
    }
  }
}
