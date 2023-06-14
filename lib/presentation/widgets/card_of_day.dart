import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../domain/models/article.dart';
import '../screens/article_screen.dart';

class CardOfDay extends StatelessWidget {
  final String title;
  final Article article;
  final String buttonCaption;

  const CardOfDay({
    super.key,
    required this.article,
    required this.buttonCaption,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.cardTitle),
                Text(article.title),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ArticleScreen.routeName,
                      arguments: article,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.primaryColor,
                    ),
                    child: Text(
                      buttonCaption,
                      style: AppTextStyles.buttonRegularCaption,
                    ),
                  ),
                )
              ],
            ),
          ),
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
