import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:real_diploma/data/datasources/firestore_database.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../domain/models/word.dart';
import '../widgets/vocabulary/add_word_dialog.dart';
import '../widgets/vocabulary/word_card.dart';

class VocabularyScreen extends StatelessWidget {
  VocabularyScreen({Key? key}) : super(key: key);

/*   final _wordController = TextEditingController();
  final _meaningController = TextEditingController(); */
  final _wordsCollection = FirebaseFirestore.instance.collection('words');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'Vocabulary',
            style: AppTextStyles.largeText,
          ),
        ),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: FirestoreDatabase().getCollection(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final word = snapshot.data![index];
                  return WordCard(
                      word: word,
                      buttonHandler: () {} /* goToAboutWordScreen */);
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: FloatingActionButton(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          onPressed: () => _showAddWordDialog(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future _showAddWordDialog(BuildContext context) async {
    return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) {
        return const AddWordDialog();
      },
    );
  }
}
