import 'package:chat_app/presentation/controllers/splash/splash_screen_controller.dart';
import 'package:get/get.dart';
import 'package:chat_app/presentation/controllers/auth/auth_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(SplashScreenController(), permanent: true);
  }
}
