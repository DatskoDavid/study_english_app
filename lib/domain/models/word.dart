import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'meaning.dart';

class Word extends Equatable {
  final int? id;
  final String word;
  final String phonetic;
  final List<Meaning> meanings;

  const Word({
    this.id,
    required this.word,
    required this.phonetic,
    required this.meanings,
  });


/* factory Word.fromDTO(WordApi wordApi) {
    final allMeanings = wordApi.results;

    final formattedMeaningList =
        allMeanings.map(((item) => MeaningMapper.fromApi(item))).toList();

    print('domain ${wordApi.word}');

    return Word(
        word: wordApi.word,
        phonetic: wordApi.pronunciation,
        meanings: formattedMeaningList);
  } */

  
  factory Word.fromFirestore(
    DocumentSnapshot<Object?> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data() as Map<String, dynamic>;

    // final allMeanings = data['meanings'];

    // final formattedMeaningList =
    //     allMeanings.map(((item) => Meaning.fromFirestore(item))).toList();

    return Word(
      word: data['word'],
      phonetic: data['phonetic'],
      // meanings: formattedMeaningList,
      meanings: [],
    );
  }

  Map<String, dynamic> toFirestore() {
    final formattedMeaningList =
        meanings.map(((item) => Meaning.toFirestore(item))).toList();

    print(formattedMeaningList);

    return {
      'word': word,
      'phonetic': phonetic,
      'meanings': formattedMeaningList,
    };
  }

  Word copyWith({
    int? id,
    String? word,
    String? phonetic,
    List<Meaning>? meanings,
  }) {
    return Word(
      id: id ?? this.id,
      word: word ?? this.word,
      phonetic: phonetic ?? this.phonetic,
      meanings: meanings ?? this.meanings,
    );
  }

  @override
  List<Object?> get props => [id, word, phonetic, meanings];
}
