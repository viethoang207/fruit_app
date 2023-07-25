import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:training_example/constants/constants.dart';
import 'package:training_example/utils/firebase_error_list.dart';

@singleton
class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      return getErrorString(errorCode: error.code);
    }
    return Constants.loginSuccess;
  }

  Future<String> createAccount({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      return getErrorString(errorCode: error.code);
    }
    await signIn(email: email, password: password);
    return Constants.loginSuccess;
  }

  void signOut() async{
    await _firebaseAuth.signOut();
  }
}
