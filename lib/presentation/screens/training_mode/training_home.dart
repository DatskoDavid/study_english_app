import 'package:flutter/material.dart';
import 'package:real_diploma/data/articles_fake_data/articles_data.dart';
import 'package:real_diploma/presentation/widgets/article_card.dart';

import '../../../constants/text_styles.dart';
import '../../widgets/training/training_card.dart';

class TrainingHome extends StatelessWidget {
  static const routeName = '/main_training_screen';

  const TrainingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              right: 20,
              bottom: 50,
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Trainings',
                  style: AppTextStyles.sectionTitle,
                ),
                const SizedBox(height: 10),
                const TrainingCard(
                  title: 'Test',
                  description: 'Choose the correct word',
                  routeName: '',
                ),
                const SizedBox(height: 20),
                const TrainingCard(
                  title: 'Enter a word',
                  description: 'Print the full word',
                  routeName: '',
                ),
                const SizedBox(height: 30),
                const Text(
                  'Articles',
                  style: AppTextStyles.sectionTitle,
                ),
                const SizedBox(height: 10),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ArticleCard(
                      article: articles[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: articles.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
