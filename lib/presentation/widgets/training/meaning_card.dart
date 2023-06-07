import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../domain/models/meaning.dart';

class MeaningCard extends StatelessWidget {
  final Meaning meaning;

  const MeaningCard({
    super.key,
    required this.meaning,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(5.0),
          child: Text(
            meaning.partOf,
            style: AppTextStyles.smallText,
            textAlign: TextAlign.center,
          ),
        ),
        title: Text(meaning.meaning),
        // subtitle: const Text('example'),
      ),
    );
  }
}
