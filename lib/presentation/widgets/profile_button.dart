import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final Function() handler;
  final IconData icon;

  const ProfileButton({
    Key? key,
    required this.title,
    required this.handler,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handler,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyles.largeText,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_rounded),
          ],
        ),
      ),
    );
  }
}
