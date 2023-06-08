import 'package:flutter/material.dart';
import 'package:real_diploma/constants/colors.dart';
import 'package:real_diploma/constants/dimens.dart';
import 'package:real_diploma/domain/models/article.dart';
import 'package:real_diploma/presentation/screens/article_screen.dart';

import '../../../constants/text_styles.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.large),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: AppTextStyles.smallText,
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ArticleScreen.routeName,
                      arguments: article,
                    );
                  },
                  child: Container(
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Read',
                        style: AppTextStyles.buttonRegularCaption,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              width: 50,
              child: Image.asset(article.image),
            ),
          ),
        ],
      ),
    );
  }
}
