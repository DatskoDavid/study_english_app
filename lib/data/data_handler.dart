import 'package:real_diploma/data/mappers/word_mapper.dart';

import 'datasources/firebase_datasource.dart';
import 'datasources/word_datasource.dart';

class DataHandler {
  static void addWordWorkflow(String eneteredWord) async {
    final response = await WordsDatsource.getWord(eneteredWord);
    print(response);

    final word = WordMapper.fromApi(response);

    final wordJson = word.toFirestore();

    final firestoreDb = FirestoreDatabase();

    firestoreDb.addWord(wordJson);
  }
}
