import 'package:flutter/material.dart';
import 'package:real_diploma/constants/colors.dart';
import 'package:real_diploma/constants/dimens.dart';

import '../../constants/text_styles.dart';
import '../../domain/models/article.dart';

class ArticleScreen extends StatelessWidget {
  static const routeName = 'article';

  final Article article;

  const ArticleScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 16,
                      ),
                      Text(
                        'Back',
                        style: AppTextStyles.mediumText,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      article.title,
                      style: AppTextStyles.cardTitle,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 250,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          AppBorderRadius.large,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppBorderRadius.big,
                        ),
                        child: Image.asset(
                          article.image,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          AppBorderRadius.large,
                        ),
                      ),
                      child: Text(
                        article.text,
                        style: AppTextStyles.mediumText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
