import 'result_api.dart';

class WordApi {
  final String word;
  final String pronunciation;
  final List<ResultApi> results;

  WordApi({
    required this.word,
    required this.pronunciation,
    required this.results,
  });

  factory WordApi.fromJson(Map<String, dynamic> json) {
    final allPronunciations = json['pronunciation'];

    final resultsJson = json['results'] as List;

    final resultsList =
        resultsJson.map(((item) => ResultApi.fromJson(item))).toList();

    final checkWord = json['word'] as String;
    print('---$checkWord---');

    return WordApi(
      word: json['word'] as String,
      pronunciation: allPronunciations['all'] as String,
      results: resultsList,
    );
  }

  Map<String, dynamic> toJson() => {
        'word': word,
        'pronunciation': pronunciation,
        'results': results,
      };
}
