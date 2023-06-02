import 'package:flutter/material.dart';

import '../../../constants/text_styles.dart';
import '../../widgets/auth/password_textfield.dart';
import '../../widgets/auth/sign_in_button.dart';
import '../../widgets/auth/simple_textfield.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 100,
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
                const SizedBox(height: 80),
                const Text(
                  'Welcome back you\'ve been missed!',
                  style: AppTextStyles.mediumText,
                ),
                const SizedBox(height: 50),
                SimpleTextField(
                  label: 'Name',
                  hintText: 'Start typing...',
                  controller: nameController,
                ),
                const SizedBox(height: 20),
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
                /* const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Fogot Password?',
                      style: AppTextStyles.forgotPasswordText,
                    ),
                  ),
                ), */
                const SizedBox(height: 70),
                SignInButton(
                  caption: 'Sign Up',
                  onTap: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
