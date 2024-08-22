import 'package:flutter/material.dart';
import 'package:real_diploma/data/auth_service.dart';
import 'package:real_diploma/presentation/screens/skeleton_screen.dart';

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
        resizeToAvoidBottomInset: false,
        body: Padding(
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
                hintText: 'Your name',
                controller: nameController,
              ),
              const SizedBox(height: 18),
              SimpleTextField(
                label: 'Email address',
                hintText: 'Your email',
                controller: emailController,
              ),
              const SizedBox(height: 18),
              PasswordTextField(
                label: 'Password',
                hintText: 'Password',
                controller: passwordController,
              ),
              const SizedBox(height: 50),
              SignInButton(
                caption: 'Sign Up',
                onTap: () async {
                  final message = await AuthService().registration(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (message!.contains('Success')) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const SkeletonScreen()));
                  }
                  if (message != 'Success') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
                    );
                  }
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: AppTextStyles.mediumText,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Log in',
                      style: AppTextStyles.signInLink,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
