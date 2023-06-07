import 'package:flutter/material.dart';
import 'package:real_diploma/constants/colors.dart';
import 'package:real_diploma/constants/dimens.dart';

import '../../../constants/text_styles.dart';

class TrainingCard extends StatelessWidget {
  final String title;
  final String description;
  final String routeName;

  const TrainingCard({
    Key? key,
    required this.title,
    required this.description,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.large),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.titleText,
              ),
              Text(
                description,
                style: AppTextStyles.captionText,
              )
            ],
          ),
          const Spacer(),
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
                  'Start',
                  style: AppTextStyles.buttonRegularCaption,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
