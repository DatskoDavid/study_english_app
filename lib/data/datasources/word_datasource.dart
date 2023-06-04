import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api_models/word_api.dart';

class WordsDatsource {
  static Future<WordApi> getWord(String word) async {
    const baseUrl = 'https://wordsapiv1.p.rapidapi.com/words/';
    final requestUrl = baseUrl + word;

    final response = await http.get(
      Uri.parse(requestUrl),
      headers: {
        'X-RapidAPI-Key': '72d92e3a98mshcc5811077a6c5c2p1d4945jsn76d2c4b4e5fd',
        'X-RapidAPI-Host': 'wordsapiv1.p.rapidapi.com'
      },
    );

    if (response.statusCode == 200) {
      return WordApi.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}
