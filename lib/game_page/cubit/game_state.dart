import 'package:hangman/models/word.dart';

abstract class GameState {}

class InitGameState extends GameState {}

class UpdateGameState extends GameState {}

class LoadingGameState extends GameState {}

class ErrorGameState extends GameState {
  final String error;
  ErrorGameState(this.error);
}

class ResponseGameState extends GameState {
  final List<Word> words;
  final Word chosenWord;
  static int tries = 0;
  static List<String> selectedChar = [];
  ResponseGameState(this.words, this.chosenWord);
}
