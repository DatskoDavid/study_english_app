import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'meaning.dart';

class Word extends Equatable {
  final String? id;
  final String? authorId;
  final Timestamp? addedAt;
  final String word;
  final String phonetic;
  final List<Meaning> meanings;

  const Word({
    this.id,
    this.authorId,
    this.addedAt,
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
    //SnapshotOptions? options,
  ) {
    final data = snapshot.data() as Map<String, dynamic>;

    final allMeanings = data['meanings'] as List;

    // print('allMeanings type: ${allMeanings.runtimeType}');
    // print('allMeanings: $allMeanings');

    final formattedMeaningList =
        allMeanings.map((item) => Meaning.fromFirestore(item)).toList();

    return Word(
      id: snapshot.id,
      authorId: data['authorId'],
      addedAt: data['addedAt'],
      word: data['word'],
      phonetic: data['phonetic'],
      meanings: formattedMeaningList,
      //  meanings: [],
    );
  }

  Map<String, dynamic> toFirestore() {
    final formattedMeaningList =
        meanings.map(((item) => Meaning.toFirestore(item))).toList();

    print(formattedMeaningList);

    return {
      'authorId': authorId,
      'addedAt': addedAt,
      'word': word,
      'phonetic': phonetic,
      'meanings': formattedMeaningList,
    };
  }

  Word copyWith({
    String? id,
    String? authorId,
    Timestamp? addedAt,
    String? word,
    String? phonetic,
    List<Meaning>? meanings,
  }) {
    return Word(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      addedAt: addedAt ?? this.addedAt,
      word: word ?? this.word,
      phonetic: phonetic ?? this.phonetic,
      meanings: meanings ?? this.meanings,
    );
  }

  @override
  List<Object?> get props => [id, authorId, addedAt, word, phonetic, meanings];
}
