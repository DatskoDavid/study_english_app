import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class CardOfDay extends StatelessWidget {
  final String title;
  final String description;
  final String buttonCaption;
  final String image;

  const CardOfDay({
    super.key,
    required this.title,
    required this.description,
    required this.buttonCaption,
    required this.image,
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
                Text(description),
                InkWell(
                  onTap: () {},
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
              child: Image.asset(image),
            ),
          ),
        ],
      ),
    );
  }
}
