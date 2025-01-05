import 'dart:math';

import 'package:chat_app/core/services/auth_service.dart';
import 'package:chat_app/core/utils/error.dart';
import 'package:chat_app/core/utils/image.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/presentation/dialogs/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isObscure = true.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  RxString imagePath = "".obs;

  RxBool isLoading = false.obs;

  Future<void> registerUser() async {
    try {
      int randomAvatarIndex = Random().nextInt(70) + 1;
      LoadingDialog.show(message: "Creating user ....");
      UserModel userModel = UserModel(
          name: nameController.text,
          email: emailController.text,
          bio: bioController.text,
          profilePic: "https://i.pravatar.cc/150?img=$randomAvatarIndex",
          password: passwordController.text);
      await AuthService.registerUser(userModel);
      resetAll();
    } catch (e) {
      ErrorUtil.handleError(e);
    } finally {
      LoadingDialog.dismiss();
    }
  }

  Future<void> logInUser() async {
    try {
      LoadingDialog.show(message: "Logging in user ....");
      await AuthService.loginUser(
          emailController.text, passwordController.text);
      resetAll();
    } finally {
      LoadingDialog.dismiss();
    }
  }

  Future<void> sendEmail() async {
    try {
      LoadingDialog.show(message: "Creating user ....");
      await AuthService.sendEmail(emailController.text);
      resetAll();
    } finally {
      LoadingDialog.dismiss();
      isLoading.value = false;
    }
  }

  void changeVisibility() {
    isObscure.value = !isObscure.value;
  }

  void resetAll() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    bioController.clear();
    isObscure.value = true;
    isLoading.value = false;
    imagePath.value = "";
  }
}
