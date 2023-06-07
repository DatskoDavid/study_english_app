import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../domain/models/word.dart';

class WordCard extends StatelessWidget {
  final Word word;
  final Function buttonHandler;
  //final Function delete;

  WordCard({
    super.key,
    required this.word,
    required this.buttonHandler,
    //required this.delete,
  });

/*   Word documentSnapshotToWordModel() {
    final documentSnapshotList = [];
    documentSnapshotList.add(documentSnapshot);
    final firestoreJson = documentSnapshotList
        .map(json.decode(json.encode(documentSnapshot.data())))
        .toList();

    final wordApi = WordApi.fromJson(firestoreJson[0]);
    return WordMapper.fromApi(wordApi);
  } */

  // late final word = documentSnapshotToWordModel();

  @override
  Widget build(BuildContext context) {
    // print(word);
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
                  // onTap: () => buttonHandler(context, word),
                  onTap: () => buttonHandler(context),
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
