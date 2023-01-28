// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'package:hangman/models/word.dart';
import 'package:hangman/repository/environment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WordRepository {
  /// Makes an API call to [apiHost] using your [apiKey].
  /// Returns a list of random [words].
  Future<List<Word>> fetchWords() async {
    var url =
        "https://${Environment.apiHost}/getMultipleRandom?count=5&minLength=3&maxLength=7";
    var headers = {
      'X-RapidAPI-Key': Environment.apiKey,
    };
    final uri = Uri.parse(url);
    if (kDebugMode) {
      print(uri);
    }
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((e) {
        return Word(word: e);
      }).toList();
      return result;
    } else {
      throw "Error : ${jsonDecode(response.body)}";
    }
  }

  /// Returns a list of [Words] without calling the API.
  Future<List<Word>> getFiveFromLocal() async {
    final result = ['random', 'word', 'for', 'testing', 'purpose'].map((e) {
      return Word(word: e);
    }).toList();
    return result;
  }
}
