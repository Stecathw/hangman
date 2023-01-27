class GameState {
  List<String> chosenLetters = [];
  int tries = 0;
  final int maxTries = 6;
  GameState({required this.chosenLetters, required this.tries});
}

// TODO : add state for lostGame
// class CurrentGameState extends GameState {
//   List<String> chosenLetters = [];
//   int tries = 0;
//   final int maxTries = 6;
//   CurrentGameState({required this.chosenLetters, required this.tries});
// }

// class LostGame extends GameState {}
