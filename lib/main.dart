import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'domain/models/article.dart';
import 'domain/models/meaning.dart';
import 'domain/models/training_info.dart';
import 'domain/models/word.dart';
import 'firebase_options.dart';
import 'constants/colors.dart';

import 'presentation/screens/article_screen.dart';
import 'presentation/screens/auth/registration_screen.dart';
import 'presentation/screens/bottom_nav_bar_controller.dart';
import 'presentation/screens/training_mode/quiz/quiz_training.dart';
import 'presentation/screens/training_mode/simple/about_word_screen.dart';
import 'presentation/screens/training_mode/training_home.dart';
import 'presentation/screens/auth/auth_handler_screen.dart';
import 'presentation/screens/training_mode/simple/input_word_screen.dart';
import 'presentation/screens/training_mode/simple/quiz_screen.dart';
import 'presentation/screens/training_mode/simple/result_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(
          background: AppColors.background,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthHandlerScreen(),
      // home: QuizTraining(word: testWords[0]),
      onGenerateRoute: (settings) {
        if (settings.name == BottomNavBarController.routeName) {
          return MaterialPageRoute(
            builder: (context) => const BottomNavBarController(),
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

final testWords = [
  const Word(
    word: 'book',
    phonetic: '[buk]',
    meanings: [
      Meaning(
        partOf: 'noun',
        meaning:
            'physical objects cosisting of a number of page bound together',
      ),
    ],
  ),
];
