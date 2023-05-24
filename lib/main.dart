import 'package:flutter/material.dart';
import 'package:real_diploma/presentation/screens/bottom_nav_bar_controller.dart';

import 'constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      home: const BottomNavBarController(),
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
