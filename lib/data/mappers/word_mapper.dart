import '../../domain/models/word.dart';
import '../api_models/word_api.dart';
import 'meaning_mapper.dart';

class WordMapper{
  static Word fromApi(WordApi wordApi) {
    final meaningsApiList = wordApi.results;

    final formattedMeaningList =
        meaningsApiList.map(((item) => MeaningMapper.fromApi(item))).toList();

    return Word(
      word: wordApi.word,
      phonetic: wordApi.pronunciation,
      meanings: formattedMeaningList,
    );
  }
}