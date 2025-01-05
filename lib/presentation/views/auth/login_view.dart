import 'dart:developer';

import 'package:chat_app/core/constants/app_colors.dart';
import 'package:chat_app/core/constants/app_size.dart';
import 'package:chat_app/presentation/widgets/text/text_widget.dart';
import 'package:chat_app/presentation/widgets/text_field/custom_text_field.dart';
import 'package:chat_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_app/presentation/controllers/auth/auth_controller.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/text/rich_text.dart';

class LoginView extends StatelessWidget {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.w3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: AppSize.h2,
            children: [
              SizedBox(
                height: AppSize.h2,
              ),
              TextWidget(
                title: "Login",
                fontSize: 24,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: AppSize.h2),
              CustomTextField(
                hintText: "Email",
                controller: authController.emailController,
              ),

              //Enter Password here
              Obx(
                () => CustomTextField(
                  hintText: "Password",
                  controller: authController.passwordController,
                  isObscure: authController.isObscure.value,
                  suffixIcon: InkWell(
                      onTap: () {
                        authController.changeVisibility();
                      },
                      child: Icon(
                        !authController.isObscure.value
                            ? Icons.visibility_off // Closed eye icon
                            : Icons.visibility,
                        color: AppColors.primaryColor,
                      )),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppPages.forgotPassword);
                  },
                  child: TextWidget(
                    title: "Forgot password?",
                    textDecoration: TextDecoration.underline,
                    underLineColor: AppColors.primaryColor,
                  ),
                ),
              ),

              CustomButton(
                title: "Login",
                onTap: () {
                  log("Isloading ${authController.isLoading.value}");
                  authController.logInUser();
                },
              ),
              CustomRichText(
                firstPart: "Don’t have an account? ",
                highlightedPart: "Sign Up",
                firstPartStyle: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                ),
                highlightedPartStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                onHighlightedPartTap: () {
                  authController.resetAll();
                  Get.toNamed(AppPages.signup);
                },
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
