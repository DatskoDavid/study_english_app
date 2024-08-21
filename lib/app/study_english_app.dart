import 'package:flutter/material.dart';
import 'package:real_diploma/constants/colors.dart';
import 'package:real_diploma/domain/models/article.dart';
import 'package:real_diploma/domain/models/training_info.dart';
import 'package:real_diploma/domain/models/word.dart';
import 'package:real_diploma/presentation/screens/article_screen.dart';
import 'package:real_diploma/presentation/screens/auth/auth_handler_screen.dart';
import 'package:real_diploma/presentation/screens/auth/registration_screen.dart';
import 'package:real_diploma/presentation/screens/skeleton_screen.dart';
import 'package:real_diploma/presentation/screens/training_mode/simple/about_word_screen.dart';
import 'package:real_diploma/presentation/screens/training_mode/simple/input_word_screen.dart';
import 'package:real_diploma/presentation/screens/training_mode/simple/quiz_screen.dart';
import 'package:real_diploma/presentation/screens/training_mode/simple/result_screen.dart';
import 'package:real_diploma/presentation/screens/training_mode/training_home.dart';

class StudyEnglishApp extends StatelessWidget {
  const StudyEnglishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(
          surface: AppColors.background,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthHandlerScreen(),
      // home: QuizTraining(word: testWords[0]),
      onGenerateRoute: (settings) {
        if (settings.name == SkeletonScreen.routeName) {
          return MaterialPageRoute(
            builder: (context) => const SkeletonScreen(),
          );
        } else if (settings.name == RegistrationScreen.routeName) {
          return MaterialPageRoute(
            builder: (context) => RegistrationScreen(),
          );
        } else if (settings.name == AboutWordScreen.routeName) {
          final word = settings.arguments as Word;

          return MaterialPageRoute(
            builder: (context) => AboutWordScreen(word: word),
          );
        } else if (settings.name == QuizScreen.routeName) {
          final word = settings.arguments as Word;

          return MaterialPageRoute(
            builder: (context) => QuizScreen(word: word),
          );
        } else if (settings.name == InputWordScreen.routeName) {
          final trainingInfo = settings.arguments as TrainingInfo;

          return MaterialPageRoute(
            builder: (context) => InputWordScreen(trainingInfo: trainingInfo),
          );
        } else if (settings.name == ResultScreen.routeName) {
          final trainingInfo = settings.arguments as TrainingInfo;

          return MaterialPageRoute(
            builder: (context) => ResultScreen(trainingInfo: trainingInfo),
          );
        } else if (settings.name == TrainingHome.routeName) {
          return MaterialPageRoute(
            builder: (context) => const TrainingHome(),
          );
        } else if (settings.name == ArticleScreen.routeName) {
          final article = settings.arguments as Article;

          return MaterialPageRoute(
            builder: (context) => ArticleScreen(article: article),
          );
        }
        assert(false, 'Need to implement: ${settings.name}');
        return null;
      },
    );
  }
}
