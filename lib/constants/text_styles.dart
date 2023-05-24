import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTextStyles {
  static const smallText = TextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static const regularText = TextStyle(
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

  static const cardOfDayTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const buttonRegularCaption = TextStyle(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );

  static const largeText = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static const captionText = TextStyle(
    fontSize: 12,
    color: AppColors.lightGrey,
    fontWeight: FontWeight.w400,
  );

  static const appBarTitle = TextStyle(
    fontSize: 20,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );
}
