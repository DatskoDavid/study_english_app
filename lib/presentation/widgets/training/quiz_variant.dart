import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class QuizVariant extends StatefulWidget {
  final String variant;
  final bool isCorrect;
  final Function onTapHandler;
  bool showCorrectAnswer;

  QuizVariant({super.key, 
    required this.variant,
    required this.isCorrect,
    required this.onTapHandler,
    required this.showCorrectAnswer,
  });

  @override
  State<QuizVariant> createState() => _QuizVariantState();
}

class _QuizVariantState extends State<QuizVariant> {
  bool isPressed = false;
  
  Color getColor() {
    if (widget.isCorrect && isPressed ||
        widget.isCorrect && widget.showCorrectAnswer) {
      return AppColors.green;
    } else if (isPressed && !widget.isCorrect) {
      return AppColors.red;
    }

    return const Color.fromARGB(255, 229, 230, 236);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 40,
      duration: const Duration(milliseconds: 1000),
      decoration: BoxDecoration(
        color: getColor(),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        child: InkWell(
          splashColor: const Color.fromARGB(255, 131, 118, 118),
          onTap: (() {
            isPressed = true;
            widget.onTapHandler(widget.variant);
          }),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.variant,
                style: TextStyle(
                  color: isPressed ? AppColors.white : AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
