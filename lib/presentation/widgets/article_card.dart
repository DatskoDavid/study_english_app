import 'package:flutter/material.dart';
import 'package:real_diploma/constants/colors.dart';
import 'package:real_diploma/constants/dimens.dart';

import '../../../constants/text_styles.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String image;

  const ArticleCard({
    super.key,
    required this.title,
    required this.image,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.smallText,
                ),
                InkWell(
                  // onTap: () => buttonHandler(),
                  onTap: () {},
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
          SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              width: 50,
              child: Image.asset(image),
            ),
          ),
        ],
      ),
    );
  }
}
