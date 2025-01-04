import 'dart:io';
import 'package:chat_app/core/constants/app_colors.dart';
import 'package:chat_app/core/constants/app_size.dart';
import 'package:chat_app/presentation/controllers/auth/auth_controller.dart';
import 'package:chat_app/presentation/widgets/text/text_widget.dart';
import 'package:chat_app/presentation/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/text/rich_text.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: AppSize.h2,
              children: [
                SizedBox(
                  height: AppSize.h2,
                ),
                TextWidget(title: "Signup"),
                Obx(() => GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.primaryColor,
                        child: authController.imagePath.value != ""
                            ? Image.file(File(authController.imagePath.value))
                            : Icon(
                                Icons.person,
                                size: 30,
                              ),
                      ),
                    )),
                CustomTextField(
                  hintText: "Email",
                  controller: authController.emailController,
                ),
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
                CustomTextField(
                  hintText: "Bio",
                  controller: authController.bioController,
                  minLine: 3,
                  maxLine: 6,
                ),
                CustomButton(title: "Signup", onTap: () {}),
                CustomRichText(
                  firstPart: "Already have an account? ",
                  highlightedPart: "Log In",
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
                    Get.toNamed(AppPages.login);
                  },
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
