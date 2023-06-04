import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../domain/models/word.dart';

class FirestoreDatabase {
  static String? userUid;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Word> getWord(String id) async {
    final wordRef = _firestore.collection('words').doc(id);
    late final word;

    wordRef.get().then(
      (DocumentSnapshot doc) {
        word = Word.fromFirestore(doc);
      },
      onError: (e) => debugPrint("Error getting document: $e"),
    );

    return word;
  }

  Future<List<Word>> getAll() async {
    final wordsList = <Word>[];

    _firestore.collection('words').get().then(
      (querySnapshot) {
        debugPrint("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          debugPrint('${docSnapshot.id} => ${docSnapshot.data()}');

          wordsList.add(Word.fromFirestore(docSnapshot));
        }
      },
    );

    return wordsList;
  }

  Future<void> addWord(Map<String, dynamic> word) async {
    final docRef = _firestore.collection('words').doc();

    await docRef.set(word).onError(
          (e, _) => debugPrint("Error writing document: $e"),
        );
  }

  //if edit word in Firestore need to get this word from WordsApi
  Future<void> updateWord(String id, String editedWord) async {
    final word = _firestore.collection('words').doc(id);

    word.update({'word': editedWord}).then(
      (value) => debugPrint("DocumentSnapshot successfully updated!"),
      onError: (e) => debugPrint("Error updating document $e"),
    );
  }

  Future<void> deleteWord(String id) async {
    _firestore.collection('words').doc(id).delete().then(
          (doc) => debugPrint("Document deleted"),
          onError: (e) => debugPrint("Error updating document $e"),
        );
  }
}
