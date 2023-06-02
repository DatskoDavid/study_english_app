import 'package:flutter/material.dart';
import 'package:real_diploma/constants/colors.dart';
import 'package:real_diploma/constants/text_styles.dart';
import 'package:real_diploma/presentation/widgets/profile_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          right: 20,
          bottom: 0,
          left: 20,
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: AppColors.profileLogoBg,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  color: AppColors.profileIcon,
                  size: 80,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Name of user',
              style: AppTextStyles.mediumText,
            ),
            const SizedBox(height: 50),
            ProfileButton(
              title: 'Settings',
              handler: () {},
              icon: Icons.settings_rounded,
            ),
            const SizedBox(height: 15),
            ProfileButton(
              title: 'Contact us',
              handler: () {},
              icon: Icons.call,
            ),
            const SizedBox(height: 15),
            ProfileButton(
              title: 'About us',
              handler: () {},
              icon: Icons.book,
            ),
            const SizedBox(height: 15),
            ProfileButton(
              title: 'Privacy and Rules',
              handler: () {},
              icon: Icons.privacy_tip_outlined,
            ),
            const Spacer(),
            const Text(
              'All rights reserved',
              style: AppTextStyles.phoneticText,
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
