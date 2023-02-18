import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  static final instance = FirebaseAuth.instance;
  static final authChange = instance.userChanges();

  Future<User?> singInWithPhoneNumber(PhoneAuthCredential credential) async {
    final user = await instance.signInWithCredential(credential);
    return user.user;
  }

  Future<User?> singInWithEmail(String email, String password) async {
    final user = await instance.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  Future<User?> createUserWithEmail(String email, String password) async {
    final user = await instance.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }
}
