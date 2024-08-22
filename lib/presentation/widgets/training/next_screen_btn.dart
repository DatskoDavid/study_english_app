import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';

class NextScreenBtn extends StatelessWidget {
  final String routeName;
  final Object? arguments;
  final Function? handler;

  const NextScreenBtn({
    super.key,
    required this.routeName,
    this.arguments,
    this.handler,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(
          context,
          routeName,
          arguments: arguments,
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
        ),
        child: const Text(
          'Next',
          style: AppTextStyles.nextScreenBtnCaption,
        ),
      ),
    );
  }
}
