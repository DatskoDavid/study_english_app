import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:real_diploma/presentation/screens/article_screen.dart';

import 'firebase_options.dart';
import 'constants/colors.dart';
import 'presentation/screens/auth/auth_handler_screen.dart';

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
      // home: const MainScreen(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(
          background: AppColors.background,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthHandlerScreen(),
    );
  }
}

// final testWord = Word(
//   word: 'book',
//   phonetic: '[buk]',
//   meanings: [
//     Meaning(
//       partOf: 'noun',
//       meaning: 'physical objects cosisting of a number of page bound together',
//     ),
//     Meaning(
//       partOf: 'verb',
//       meaning: 'a record in which commercial accounts are recorded',
//     ),
//     Meaning(
//       partOf: 'noun',
//       meaning: 'physical objects cosisting of a number of page bound together',
//     ),
//     Meaning(
//       partOf: 'noun',
//       meaning: 'physical objects cosisting of a number of page bound together',
//     ),
//   ],
// );
