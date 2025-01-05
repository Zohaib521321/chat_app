import 'package:chat_app/core/services/db_service.dart';
import 'package:chat_app/core/utils/error.dart';
import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/presentation/dialogs/loading_dialog.dart';
import 'package:chat_app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<String?> getCurrentUserId() async {
    return _firebaseAuth.currentUser?.uid;
  }

  static Future registerUser(UserModel userModel) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
      await DbService.storeUserInformation(userModel);
      Get.offAllNamed(AppPages.login);
    } catch (e) {
      ErrorUtil.handleError(e);
    }
  }

  static Future loginUser(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.offAllNamed(AppPages.chatScreen);
    } catch (e) {
      ErrorUtil.handleError(e);
    }
  }

  static Future sendEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      Get.offAllNamed(AppPages.login);
    } catch (e) {
      ErrorUtil.handleError(e);
    }
  }

  static Future logoutUser() async {
    try {
      LoadingDialog.show(message: "Logging out user");
      await _firebaseAuth.signOut();
    } catch (e) {
      ErrorUtil.handleError(e);
    } finally {
      LoadingDialog.dismiss();
    }
  }
}
