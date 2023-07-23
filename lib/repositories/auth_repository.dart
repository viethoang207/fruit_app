import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:training_example/constants/constants.dart';

@injectable
class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          break;
        case "wrong-password":
          break;
        case "user-not-found":
          break;
        case "user-disabled":
          break;
        case "too-many-requests":
          break;
        case "operation-not-allowed":
          break;
      }
    }
    return Constants.loginSuccess;
  }

  void signOut() async{
    await _firebaseAuth.signOut();
  }
}
