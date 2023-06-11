import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_diploma/data/mappers/word_mapper.dart';

import 'datasources/firestore_database.dart';
import 'datasources/word_datasource.dart';

class DataHandler {
  static void addWordWorkflow(String eneteredWord) async {
    final response = await WordsDatsource.getWord(eneteredWord);
    
    var word = WordMapper.fromApi(response);
    word = word.copyWith(authorId: FirebaseAuth.instance.currentUser!.uid);

    final wordJson = word.toFirestore();

    final firestoreDb = FirestoreDatabase();

    firestoreDb.addWord(wordJson);
  }
}
