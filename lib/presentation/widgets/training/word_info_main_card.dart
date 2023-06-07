import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../domain/models/word.dart';

class WordInfoMainCard extends StatelessWidget {
  final Word word;
  final Function buttonHandler;

  const WordInfoMainCard({
    super.key,
    required this.word,
    required this.buttonHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(word.word, style: AppTextStyles.largeText),
                      const SizedBox(width: 15),
                      // const Icon(Icons.volume_up_rounded),
                    ],
                  ),
                  Text(word.phonetic, style: AppTextStyles.phoneticText),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () => buttonHandler(context, word),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.primaryColor,
                      ),
                      child: const Text(
                        'Go study',
                        style: AppTextStyles.buttonRegularCaption,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 150,
              child: Image.asset('assets/images/1.png'),
            ),
          ],
        ),
      ),
    );
  }
}
