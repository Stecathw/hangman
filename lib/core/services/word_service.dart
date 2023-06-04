import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hangman/core/models/word.dart';
import 'package:http/http.dart' as http;
import 'package:diacritic/diacritic.dart';

class WordService {
  final String apiKey;
  final String apiHost;
  final String languageCode;

  WordService({
    required this.apiKey,
    required this.apiHost,
    required this.languageCode,
  });

  /// Makes an API call to get multiple random words for English.
  /// Returns a list of random [Word] objects.
  Future<List<Word>> fetchEnglishWords() async {
    final url =
        'https://$apiHost/getMultipleRandom?count=5&minLength=3&maxLength=7';
    final headers = {
      'X-RapidAPI-Key': apiKey,
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
      throw Exception('Error: ${jsonDecode(response.body)}');
    }
  }

  /// Makes an API call to get a single random word for French.
  /// Returns a single [Word] object.
  Future<Word> fetchFrenchWord() async {
    final url = 'https://trouve-mot.fr/api/sizemax/7';
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final frenchWordData = json.first;

      final word = Word(
        word: removeDiacritics(frenchWordData['name']),
      );
      return word;
    } else {
      throw Exception('Error: ${jsonDecode(response.body)}');
    }
  }

  // Add more API calls for other languages
  Future<List<Word>> fetchWords() async {
    if (languageCode == 'fr') {
      final frenchWord = await fetchFrenchWord();
      return [frenchWord];
    } else {
      return fetchEnglishWords();
    }
  }
}
