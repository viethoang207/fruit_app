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
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          return "Email already used. Go to login page.";
        case "wrong-password":
          return "Wrong email/password combination.";
        case "user-not-found":
          return "No user found with this email.";
        case "user-disabled":
          return "User disabled.";
        case "operation-not-allowed":
          return "Too many requests to log into this account.";
        case "invalid-email":
          return "Email address is invalid.";
        default:
          return "Login failed. Please try again.";
      }
    }
    return Constants.loginSuccess;
  }

  void signOut() async{
    await _firebaseAuth.signOut();
  }
}
