import 'package:chat_app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../core/services/auth_service.dart';

class SplashScreenController extends GetxController {
  Future<void> navigateToNextScreen() async {
    String? uid = await AuthService.getCurrentUserId();
    Future.delayed(Duration(seconds: 4), () {
      if (uid != null) {
        Get.offAllNamed(AppPages.chatScreen);

      }
      else{
        Get.offAllNamed(AppPages.login);
      }
    });
  }
}
