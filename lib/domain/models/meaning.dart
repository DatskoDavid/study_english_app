class Meaning {
  final String partOf;
  final String meaning;

  Meaning({
    required this.partOf,
    required this.meaning,
  });

  factory Meaning.fromFirestore(Map<String, String> map) {
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

  List<Object?> get props => [partOf, meaning];
}
