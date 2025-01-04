import 'package:chat_app/core/constants/app_colors.dart';
import 'package:chat_app/core/constants/app_images.dart';
import 'package:chat_app/core/constants/app_size.dart';
import 'package:chat_app/presentation/controllers/splash/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashScreenController>();
    controller.navigateToNextScreen();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Lottie.asset(
          height: AppSize.getHeight(60),
          width: AppSize.getWidth(50),
          AppImages.splashScreen,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
