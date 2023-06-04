class ResultApi {
  final String partOfSpeech;
  final String definition;
  // final List<String?> examples;

  ResultApi({
    required this.partOfSpeech,
    required this.definition,
    // required this.examples,
  });

  factory ResultApi.fromJson(Map<String, dynamic> json) {
    /* final examplesJson = json['examples'];
    final examplesList = examplesJson.cast<String>() as List; */

    return ResultApi(
      partOfSpeech: json['partOfSpeech'] as String,
      definition: json['definition'] as String,
      // examples: examplesList,
    );
  }

  Map<String, dynamic> toJson() => {
        'partOfSpeech': partOfSpeech,
        'definition': definition,
        //'example': examples,
      };
}