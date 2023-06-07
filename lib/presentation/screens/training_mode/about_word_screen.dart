import 'package:flutter/material.dart';

import '../../../constants/text_styles.dart';
import '../../../domain/models/word.dart';
import '../../widgets/training/meaning_card.dart';
import '../../widgets/training/word_info_main_card.dart';
import 'quiz_screen.dart';

class AboutWordScreen extends StatelessWidget {
  static String routeName = 'about_word';

  final Word word;

  const AboutWordScreen({super.key, required this.word});

  void goToQuizScreen(BuildContext context, Word word) => Navigator.pushNamed(
        context,
        QuizScreen.routeName,
        arguments: word,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 16,
                    ),
                    Text(
                      'Back',
                      style: AppTextStyles.largeText,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WordInfoMainCard(
                    word: word,
                    buttonHandler: goToQuizScreen,
                  ),
                  const SizedBox(height: 20),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: word.meanings.length,
                    itemBuilder: (context, index) {
                      return MeaningCard(meaning: word.meanings[index]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
