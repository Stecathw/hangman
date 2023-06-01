import 'package:hangman/models/word.dart';
import 'package:hangman/services/word_service.dart';

class WordRepository {
  final WordService _wordService;

  WordRepository(this._wordService);

  /// Makes an API call to get random words.
  /// Returns a list of [Word] objects.
  Future<List<Word>> fetchWords() async {
    try {
      return await _wordService.fetchWords();
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  /// Returns a list of local words for testing purposes.
  Future<List<Word>> getFiveFromLocal() async {
    final result = ['random', 'word', 'for', 'testing', 'purpose']
        .map((e) => Word(word: e))
        .toList();
    return result;
  }
}
