import 'package:chat_app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  void navigateToNextScreen() {
    Future.delayed(Duration(seconds: 4), () {
      Get.offAllNamed(AppPages.login);
    });
  }
}
