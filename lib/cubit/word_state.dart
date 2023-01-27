import 'package:hangman/models/word.dart';

abstract class WordState {}

class InitWordState extends WordState {}

class LoadingWordState extends WordState {}

class ErrorWordState extends WordState {
  final String error;
  ErrorWordState(this.error);
}

class ResponseWordState extends WordState {
  final List<Word> words;
  final Word chosenWord;
  ResponseWordState(this.words, this.chosenWord);
}
