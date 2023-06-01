abstract class GameState {
  List<String> chosenLetters = [];
  int tries = 0;
  final int maxTries = 6;
  GameState({required this.chosenLetters, required this.tries});
}

class PlayGameState extends GameState {
  PlayGameState({required super.chosenLetters, required super.tries});
}

class WonGameState extends GameState {
  WonGameState({required super.chosenLetters, required super.tries});
}

class LostGameState extends GameState {
  LostGameState({required super.chosenLetters, required super.tries});
}
