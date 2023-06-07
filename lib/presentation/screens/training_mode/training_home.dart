import 'package:flutter/material.dart';
import 'package:real_diploma/presentation/widgets/article_card.dart';

import '../../../constants/text_styles.dart';
import '../../widgets/training/training_card.dart';

class TrainingHome extends StatelessWidget {
  static const routeName = '/main_training_screen';

  const TrainingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 60,
              right: 20,
              bottom: 0,
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TrainingCard(
                  title: 'Test',
                  description: 'Choose the correct word',
                  routeName: '',
                ),
                SizedBox(height: 20),
                TrainingCard(
                  title: 'Enter a word',
                  description: 'Print the full word',
                  routeName: '',
                ),
                SizedBox(height: 20),
                TrainingCard(
                  title: 'Mixed',
                  description: 'All in one training',
                  routeName: '',
                ),
                SizedBox(height: 50),
                Text(
                  'Articles',
                  style: AppTextStyles.titleText,
                ),
                SizedBox(height: 10),
                ArticleCard(
                  title:
                      'What Happens to Your Body When You Eat Oatmeal Every Day',
                  image: 'assets/images/1.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
