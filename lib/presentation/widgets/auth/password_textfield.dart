import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimens.dart';
import '../../../constants/text_styles.dart';

class PasswordTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const PasswordTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool showPassword = true;
  bool obscureText = true;

  void _showPass() {
    if (obscureText) {
      setState(() {
        showPassword = !showPassword;
      });
    }
  }

  OutlineInputBorder _transperentBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0.0,
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
            widget.label,
            style: AppTextStyles.cardTitle,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 50,
          padding: const EdgeInsets.only(
            left: 20,
            right: 10,
          ),
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
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    obscureText: obscureText ? showPassword : false,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: _transperentBorder(),
                      focusedBorder: _transperentBorder(),
                      hintText: widget.hintText,
                      hintStyle: AppTextStyles.hintText,
                      /* IconButton(
                        onPressed: _showPass,
                        icon: const Icon(Icons.remove_red_eye,),
                      )), */
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _showPass,
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ],
            ),
          ),
        )
      ],
    );

    /* TextField(
      controller: widget.controller,
      obscureText: obscureText ? showPassword : false,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          suffixIcon: obscureText
              ? IconButton(
                  onPressed: _showPass,
                  icon: const Icon(Icons.remove_red_eye),
                )
              : null),
    ); */
  }
}
