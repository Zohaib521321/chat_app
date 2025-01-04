import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isObscure = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  RxString imagePath = "".obs;

  void changeVisibility() {
    isObscure.value = !isObscure.value;
  }

  void resetAll() {
    emailController.clear();
    passwordController.clear();
    bioController.clear();

    isObscure.value = true;

    imagePath.value = "";
  }
}
