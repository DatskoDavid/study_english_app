import 'package:flutter/material.dart';
import 'package:real_diploma/data/datasources/firestore_database.dart';
import 'package:real_diploma/presentation/screens/vocabulary_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/text_styles.dart';
import '../../../../domain/models/word.dart';
import '../../../widgets/training/quiz_variant.dart';

class QuizTraining extends StatefulWidget {
  static const routeName = 'quiz_training';

  final Word word;

  const QuizTraining({super.key, required this.word});

  @override
  State<QuizTraining> createState() => _QuizTrainingState();
}

class _QuizTrainingState extends State<QuizTraining> {
  //late TrainingInfo trainingInfo = TrainingInfo(word: widget.word);

  int questionNumber = 0;
  bool isChoosedAnswer = false;

  List<Word> allWords = VocabularyScreen().allWords;

  List<String> variants = <String>[];
// TODO : generate random variants
  void generateRrerecordedVariants(String correctWord) {
    variants = [
      'assume',
      'permit',
      'admit',
      correctWord,
      /* 
      'goal', 
      'about', 
      'vision', 
      'example',  */
    ];

    variants.shuffle();
    print('final result: $variants');
  }

  bool isCorrect(String variant) => variant == allWords[questionNumber].word;

  void showRightAnswer(String choosedAnswer) {
    //trainingInfo = trainingInfo.copyWith(quizChosenAnswer: choosedAnswer);

    setState(() {
      isChoosedAnswer = true;
    });
  }

  Future<void> getWords() async {
    allWords = await FirestoreDatabase().getCollection();
  }

  void nextQuestion() {
    print('Quiz: $allWords');
    generateRrerecordedVariants(allWords[questionNumber].word);

    setState(() {
      questionNumber++;
      isChoosedAnswer = false;
      print(isChoosedAnswer);
    });
  }

  @override
  void initState() {
    generateRrerecordedVariants(/* allWords[0].word */ 'first');
    getWords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: FirestoreDatabase().getCollection(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
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
                        // widget.word.meanings[0].meaning,
                        // snapshot.data.
                        allWords[questionNumber].meanings[0].meaning,
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
                        onTapHandler: showRightAnswer,
                        showCorrectAnswer: isChoosedAnswer,
                      );
                    },
                    itemCount: variants.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => nextQuestion(),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor),
                      ),
                      child: const Text(
                        'Next',
                        style: AppTextStyles.nextScreenBtnCaption,
                      ),
                    ),
                  ),
                ],
              );
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
