import 'package:equatable/equatable.dart';

class Meaning  extends Equatable {
  final String partOf;
  final String meaning;

  const Meaning({
    required this.partOf,
    required this.meaning,
  });

  factory Meaning.fromFirestore(Map<String, dynamic> map) {
    return Meaning(
      partOf: map['partOf']!,
      meaning: map['meaning']!,
    );
  }

  static Map<String, dynamic> toFirestore(Meaning meaning) {
    return {
      'partOf': meaning.partOf,
      'meaning': meaning.meaning,
    };
  }

  Meaning copyWith({
    String? partOf,
    String? meaning,
  }) {
    return Meaning(
      partOf: partOf ?? this.partOf,
      meaning: meaning ?? this.meaning,
    );
  }

  @override
  List<Object?> get props => [partOf, meaning];
}
