import 'package:flutter/material.dart';

import '../../../constants/text_styles.dart';

class TrainingHome extends StatelessWidget {
  static const routeName = '/main_training_screen';

  const TrainingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Training'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Training screen',
            style: AppTextStyles.regularText,
          ),
        ),
      ),
    );
  }
}
