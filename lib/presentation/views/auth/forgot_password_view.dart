import 'package:chat_app/core/constants/app_size.dart';
import 'package:chat_app/presentation/controllers/auth/auth_controller.dart';
import 'package:chat_app/presentation/widgets/text/text_widget.dart';
import 'package:chat_app/presentation/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button/custom_button.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            spacing: AppSize.h2,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSize.h2,
              ),
              TextWidget(
                title: "Forgot Password",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                title:
                    "Please enter your email, and we will send you an email to reset your password.",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
              ),
              CustomTextField(
                hintText: "Email",
                controller: authController.emailController,
              ),
              CustomButton(title: "Send email", onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
