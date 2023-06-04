import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthController {
  get userName {
    final user = FirebaseAuth.instance.currentUser;
    return user!.displayName ?? user.email;
  }

  void signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorMessage(e);
    }
  }

  void signUp(String name, String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorMessage(e);
    } catch (e) {
      debugPrint(e.toString());
    }

    setUserName(name);
  }

  void setUserName(String name) async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.updateDisplayName(name);
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  String? errorMessage(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      return 'Wrong password provided for that user.';
    }

    return null;
  }
}
