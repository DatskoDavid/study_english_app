import 'package:real_diploma/data/api_models/result_api.dart';
import 'package:real_diploma/domain/models/meaning.dart';

class MeaningMapper {
  static Meaning fromApi(ResultApi resultApi) {
    return Meaning(
      partOf: resultApi.partOfSpeech,
      meaning: resultApi.definition,
    );
  }
}
