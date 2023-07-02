import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  //TODO add another ways to login
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user?.uid != null;
  }
}
