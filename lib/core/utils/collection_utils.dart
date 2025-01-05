import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionUtils {
  static CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");
  static CollectionReference chatsCollection =
      FirebaseFirestore.instance.collection("chats");
}
