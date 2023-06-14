import 'package:flutter/material.dart';
import 'package:real_diploma/data/auth_controller.dart';

import '../../../constants/text_styles.dart';
import '../../widgets/auth/password_textfield.dart';
import '../../widgets/auth/sign_in_button.dart';
import '../../widgets/auth/simple_textfield.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = 'registration';

  RegistrationScreen({Key? key}) : super(key: key);

  final nameController = TextEditingController();
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
                  label: 'Name',
                  hintText: 'Start typing...',
                  controller: nameController,
                ),
                const SizedBox(height: 18),
                SimpleTextField(
                  label: 'Email',
                  hintText: 'Start typing...',
                  controller: emailController,
                ),
                const SizedBox(height: 18),
                PasswordTextField(
                  label: 'Password',
                  hintText: '*********',
                  controller: passwordController,
                ),
                const SizedBox(height: 50),
                SignInButton(
                  caption: 'Sign Up',
                  onTap: () => AuthController().signUp(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  ),
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
