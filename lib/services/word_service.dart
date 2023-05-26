import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hangman/models/word.dart';
import 'package:hangman/repository/environment.dart';
import 'package:http/http.dart' as http;

class WordService {
  /// Makes an API call to get multiple random words.
  /// Returns a list of random [Word] objects.
  Future<List<Word>> fetchWords() async {
    final url =
        "https://${Environment.apiHost}/getMultipleRandom?count=5&minLength=3&maxLength=7";
    final headers = {
      'X-RapidAPI-Key': Environment.apiKey,
    };

    final uri = Uri.parse(url);
    if (kDebugMode) {
      print(uri);
    }

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((e) => Word(word: e)).toList();
      return result;
    } else {
      throw "Error: ${jsonDecode(response.body)}";
    }
  }
}
