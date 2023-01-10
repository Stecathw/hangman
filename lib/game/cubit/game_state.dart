import 'package:hangman/models/word.dart';

abstract class GameState {}

class InitGameState extends GameState {
  static int tries = 0;
  static List<String> selectedChar = [];
}

class UpdateGameState extends GameState {}

class LoadingGameState extends GameState {}

class ErrorGameState extends GameState {
  final String error;
  ErrorGameState(this.error);
}

class ResponseGameState extends GameState {
  final List<Word> words;
  ResponseGameState(this.words);
}
