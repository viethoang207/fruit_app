import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserInfo> getCurrentUserInfo() async {
    String? username = auth.currentUser?.email;
    final docRef = db.collection('User').doc(username);
    return await docRef.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      return UserInfo.fromJson(data);
    });
  }
}
