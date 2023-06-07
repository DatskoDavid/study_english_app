import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../domain/models/training_info.dart';
import '../../../domain/models/word.dart';
import '../../widgets/training/quiz_variant.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = 'quiz';

  final Word word;

  const QuizScreen({super.key, required this.word});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late TrainingInfo trainingInfo = TrainingInfo(word: widget.word);

  bool isChoosedAnswer = false;
  List<String> variants = <String>[];

// TODO : generate random variants
  void generateRrerecordedVariants() {
    variants = [
      'assume',
      'permit',
      'admit',
      'sun'
      /* 
      'goal', 
      'about', 
      'vision', 
      'example',  */
    ];

    variants.shuffle();
    print('final result: $variants');
  }

  bool isCorrect(String variant) => variant == widget.word.word;

  void showRightAnswer(String choosedAnswer) {
    trainingInfo = trainingInfo.copyWith(quizChosenAnswer: choosedAnswer);

    setState(() {
      isChoosedAnswer = true;
    });
  }

  @override
  void initState() {
    generateRrerecordedVariants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  widget.word.meanings[0].meaning,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return QuizVariant(
                  variant: variants[index],
                  isCorrect: isCorrect(variants[index]),
                  onTapHandler: isChoosedAnswer ? () {} : showRightAnswer,
                  showCorrectAnswer: isChoosedAnswer,
                );
              },
              itemCount: variants.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
            ),
            const SizedBox(height: 50),
            /* NextScreenBtn(
              routeName: InputWordScreen.routeName,
              arguments: trainingInfo,
            ), */
          ],
        ),
      ),
    );
  }
}
