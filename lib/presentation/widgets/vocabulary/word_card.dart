import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../domain/models/word.dart';

class WordCard extends StatelessWidget {
  final Word word;
  final Function() buttonHandler;
  //final Function delete;

  const WordCard({
    super.key,
    required this.word,
    required this.buttonHandler,
    //required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: ListTile(
          title: Text(
            word.word,
            style: AppTextStyles.largeText,
          ),
          subtitle: Text(
            word.phonetic,
            style: AppTextStyles.phoneticText,
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => buttonHandler(),
                  child: Container(
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Go study',
                        style: AppTextStyles.buttonRegularCaption,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
