import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:real_diploma/data/auth_controller.dart';
import 'package:real_diploma/presentation/widgets/vocabulary/delete_word_dialog.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../domain/models/word.dart';
import '../widgets/vocabulary/add_word_dialog.dart';
import '../widgets/vocabulary/word_card.dart';
import 'training_mode/simple/about_word_screen.dart';

class VocabularyScreen extends StatelessWidget {
  final _wordsCollection = FirebaseFirestore.instance.collection('words');

  void goToAboutWordScreen(BuildContext context, Word word) =>
      Navigator.pushNamed(
        context,
        AboutWordScreen.routeName,
        arguments: word,
      );

  List<Word> allWords = <Word>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'Vocabulary',
            style: AppTextStyles.cardTitle,
          ),
        ),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
          stream: _wordsCollection
              .where(
                "authorId",
                isEqualTo: AuthController.user!.uid,
              )
              .orderBy('addedAt', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              allWords = snapshot.data!.docs
                  .map(
                    (doc) => Word.fromFirestore(doc),
                  )
                  .toList();
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final word = Word.fromFirestore(snapshot.data!.docs[index]);
                  return WordCard(
                    word: word,
                    buttonHandler: () => goToAboutWordScreen(context, word),
                    deleteWord: () => showDeleteDialog(context, word.id!),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
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

  Future showDeleteDialog(BuildContext context, String wordId) async {
    return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) {
        return DeleteWordDialog(wordId: wordId);
      },
    );
  }
}
