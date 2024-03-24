import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:real_diploma/app/study_english_app.dart';
import 'package:real_diploma/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const StudyEnglishApp());
}
