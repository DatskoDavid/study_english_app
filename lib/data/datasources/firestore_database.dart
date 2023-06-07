import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../domain/models/word.dart';

class FirestoreDatabase {
  static String? userUid;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('words');

  Future<void> getCollection() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final allWords = querySnapshot.docs.map((doc) => doc.data()).toList();

    print('1. Raw: ${allWords[0]}');

    // final List<Word> simpleWords = allWords.map((word) => Word.fromFirestore(word)).toList();

    // print('2. Converted: ${simpleWords[0]}');
  }

  /* Future<Word> getWord(String id) async {
    final wordRef = _firestore.collection('words').doc(id);
    late final Word word;

    wordRef.get().then(
      (DocumentSnapshot doc) {
        word = Word.fromFirestore(doc);
      },
      onError: (e) => debugPrint("Error getting document: $e"),
    );

    debugPrint('CHECK word: $word');

    return word;
  } */


  Future<Word?> getDataOnce_customObjects() async {
    final ref = _firestore
        .collection('words')
        .doc('LDmPK5lFnlKgHJtkzl2y')
        .withConverter(
          fromFirestore: Word.fromFirestore,
          toFirestore: (Word word, _) => word.toFirestore(),
        );

    final docSnap = await ref.get();
    final word = docSnap.data(); // Convert to Word object
    if (word != null) {
      debugPrint(word as String?);
    } else {
      debugPrint("No such document.");
    }

    return word;
  }

 /*  Future<List<Word>> getAll() async {
    var wordsList = <Word>[];

    _firestore.collection('words').get().then(
      (querySnapshot) {
        debugPrint("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          debugPrint('${docSnapshot.id} => ${docSnapshot.data()}');

          final word = Word.fromFirestore(docSnapshot, );
          debugPrint('Converted word: ');

          // wordsList.add(word) as Word;

          // wordsList.add(Word.fromFirestore(docSnapshot));
        }
      },
    );

    debugPrint('wordsList CHECK: $wordsList');
    return wordsList;
  } */

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
