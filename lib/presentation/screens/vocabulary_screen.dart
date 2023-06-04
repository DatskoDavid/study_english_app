import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../widgets/vocabulary/add_word_dialog.dart';
import '../widgets/vocabulary/word_card.dart';

class VocabularyScreen extends StatelessWidget {
  VocabularyScreen({Key? key}) : super(key: key);

/*   final _wordController = TextEditingController();
  final _meaningController = TextEditingController(); */
  final _wordsCollection = FirebaseFirestore.instance.collection('words');

  // final wordsDatsource = WordsDatsource('permit');

  /* void goToAboutWordScreen(BuildContext context, Word word) => Navigator.pushNamed(
        context,
        AboutWordScreen.routeName,
        arguments: word,
      ); */

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
        child: StreamBuilder(
          stream: _wordsCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return WordCard(
                      documentSnapshot: documentSnapshot,
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
