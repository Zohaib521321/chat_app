import 'package:chat_app/data/models/user_model.dart';
import 'package:chat_app/data/providers/api_provider.dart';

class UserRepository {
  final ApiProvider apiProvider;

  UserRepository(this.apiProvider);

  Future<UserModel> fetchUser(String id) async {
    final data = await apiProvider.getUserData(id);
    return UserModel(id: data['id'], name: data['name'], email: data['email']);
  }
}
