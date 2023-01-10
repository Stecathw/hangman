// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hangman/models/word.dart';
import 'package:hangman/repository/environment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WordRepository {
  Future<List<Word>> getAll() async {
    // Params : MultipleRandom, number of words and words length range
    var url =
        "https://${Environment.apiHost}/getMultipleRandom?count=5&minLength=3&maxLength=7";
    var headers = {
      'X-RapidAPI-Key': Environment.apiKey,
    };
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((e) {
        return Word(word: e);
      }).toList();
      return result;
    } else {
      throw "Error : ${response.statusCode}";
    }
  }
}
