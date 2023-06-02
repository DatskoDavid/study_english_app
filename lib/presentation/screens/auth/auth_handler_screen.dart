import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_diploma/presentation/screens/auth/login_screen.dart';
import 'package:real_diploma/presentation/screens/bottom_nav_bar_controller.dart';

class AuthHandlerScreen extends StatelessWidget {
  const AuthHandlerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const BottomNavBarController();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
