import 'package:chat_app/core/services/auth_service.dart';
import 'package:chat_app/core/utils/collection_utils.dart';
import 'package:chat_app/core/utils/error.dart';
import 'package:chat_app/data/models/user_model.dart';

class DbService {
  static Future<void> storeUserInformation(UserModel userModel) async {
    try {
      String? currentUserId = await AuthService.getCurrentUserId();
      await CollectionUtils.usersCollection
          .doc(currentUserId)
          .set(userModel.toFirestore());
    } catch (e) {
      ErrorUtil.handleError(e);
    }
  }
}
