import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/core/cubits/game_state.dart';
import 'package:hangman/core/models/word.dart';

/// {@template game_cubit}
/// A simple [Cubit] that manages `GameState` as its state.
/// {@endtemplate}
class GameCubit extends Cubit<GameState> {
  /// {@macro game_cubit}
  GameCubit() : super(PlayGameState(chosenLetters: [], tries: 0));

  void addLetter(String l, Word word) {
    final tryInt = isLetterInWord(l, word) ? 0 : 1;
    final totalTries = state.tries += tryInt;
    emit(PlayGameState(
        chosenLetters: List.of(state.chosenLetters)..add(l.toUpperCase()),
        tries: totalTries));
    if (isLost(totalTries)) {
      emit(
          LostGameState(chosenLetters: state.chosenLetters, tries: totalTries));
    } else if (isWordGuessed(word)) {
      emit(WonGameState(chosenLetters: state.chosenLetters, tries: totalTries));
    }
  }

  bool isLost(int totalTries) {
    return totalTries == state.maxTries;
  }

  bool isWordGuessed(Word word) {
    final letterGuessed = word
        .getLetters()
        .map((l) => state.chosenLetters.contains(l.toUpperCase()));
    return !letterGuessed.contains(false);
  }

  bool isLetterInWord(String l, Word word) {
    return word
        .getLetters()
        .map((l) => l.toUpperCase())
        .contains(l.toUpperCase());
  }

  List<String> getChosenLetters() {
    return state.chosenLetters;
  }

  bool hasBeenChosen(String l) {
    return state.chosenLetters.contains(l);
  }

  int getTries() {
    return state.tries;
  }

  void reset() {
    emit(PlayGameState(chosenLetters: [], tries: 0));
  }
}
