import 'package:flutter/material.dart';
import 'package:real_diploma/constants/colors.dart';
import 'package:real_diploma/constants/dimens.dart';

import '../../../constants/text_styles.dart';

class SignInButton extends StatelessWidget {
  final String caption;
  final Function() onTap;

  const SignInButton({
    super.key,
    required this.onTap,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(AppBorderRadius.large),
        ),
        child: Center(
          child: Text(
            caption,
            style: AppTextStyles.signInBtnCaption,
          ),
        ),
      ),
    );
  }
}
