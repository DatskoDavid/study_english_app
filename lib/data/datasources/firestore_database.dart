import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../domain/models/word.dart';

class FirestoreDatabase {
  static String? userUid;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('words');

  var user = FirebaseAuth.instance.currentUser;

  Future<List<Word>> getCollection() async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('words')
        .where(
          "authorId",
          isEqualTo: user!.uid,
        )
        .get();

    final List<Word> allWords =
        querySnapshot.docs.map((word) => Word.fromFirestore(word)).toList();

    return allWords;
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
