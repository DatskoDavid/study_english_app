import 'package:flutter/material.dart';
import 'package:real_diploma/constants/text_styles.dart';
import 'package:real_diploma/data/auth_controller.dart';
import 'package:real_diploma/presentation/screens/auth/registration_screen.dart';
import 'package:real_diploma/presentation/widgets/auth/password_textfield.dart';

import '../../widgets/auth/sign_in_button.dart';
import '../../widgets/auth/simple_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 90,
              right: 20,
              bottom: 0,
              left: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HELLO ENG',
                  style: AppTextStyles.authLogoText,
                ),
                const SizedBox(height: 40),
                const Text(
                  'Welcome back you\'ve been missed!',
                  style: AppTextStyles.mediumText,
                ),
                const SizedBox(height: 30),
                SimpleTextField(
                  label: 'Email',
                  hintText: 'Start typing...',
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                PasswordTextField(
                  label: 'Password',
                  hintText: '*********',
                  controller: passwordController,
                ),
                const SizedBox(height: 70),
                SignInButton(
                  caption: 'Sign In',
                  onTap: () => AuthController().signIn(
                    emailController.text,
                    passwordController.text,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: AppTextStyles.mediumText,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        RegistrationScreen.routeName,
                      ),
                      child: const Text(
                        'Sign Up',
                        style: AppTextStyles.signInLink,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
