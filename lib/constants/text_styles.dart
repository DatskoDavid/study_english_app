import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTextStyles {
  static const smallText = TextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );
  static const mediumText = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static const mediumPlusText = TextStyle(
    fontSize: 18,
    color: AppColors.lightText,
    fontWeight: FontWeight.w400,
  );

  static const nextScreenBtnCaption = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const phoneticText = TextStyle(
    fontSize: 16,
    color: AppColors.lightGrey,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,
  );

  static const titleText = TextStyle(
    fontSize: 20,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static const buttonRegularCaption = TextStyle(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );

  static const captionText = TextStyle(
    fontSize: 12,
    color: AppColors.lightGrey,
    fontWeight: FontWeight.w400,
  );

  static const authLogoText = TextStyle(
    fontSize: 40,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static const forgotPasswordText = TextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static const signInLink = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static const signInBtnCaption = TextStyle(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );
}
