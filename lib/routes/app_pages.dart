import 'package:chat_app/presentation/views/auth/forgot_password_view.dart';
import 'package:chat_app/presentation/views/auth/signup_view.dart';
import 'package:chat_app/presentation/views/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../presentation/views/auth/login_view.dart';

class AppPages {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String forgotPassword = "/forgotPassword";
  static final routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: signup, page: () => SignupView()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordView()),
  ];
}
