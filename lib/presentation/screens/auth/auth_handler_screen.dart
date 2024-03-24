import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_diploma/presentation/screens/auth/login_screen.dart';
import 'package:real_diploma/presentation/screens/skeleton_screen.dart';

class AuthHandlerScreen extends StatelessWidget {
  const AuthHandlerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const SkeletonScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
