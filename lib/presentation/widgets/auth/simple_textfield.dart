import 'package:flutter/material.dart';
import 'package:real_diploma/constants/colors.dart';
import 'package:real_diploma/constants/dimens.dart';

import '../../../constants/text_styles.dart';

class SimpleTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const SimpleTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  OutlineInputBorder _transperentBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors
            .transparent, // Set the color to transparent to hide the underline
        width: 0.0, // Set the width to 0.0 to hide the underline
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: AppTextStyles.largeText,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: AppColors.white,
            // borderRadius: BorderRadius.circular(AppBorderRadius.large),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppBorderRadius.large),
              topLeft: Radius.circular(AppBorderRadius.small),
              bottomRight: Radius.circular(AppBorderRadius.large),
              bottomLeft: Radius.circular(AppBorderRadius.large),
            ),
          ),
          child: Center(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                isCollapsed: true,
                border: _transperentBorder(),
                focusedBorder: _transperentBorder(),
                hintText: hintText,
              ),
            ),
          ),
        )
      ],
    );

    /* return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
    ); */
  }
}
