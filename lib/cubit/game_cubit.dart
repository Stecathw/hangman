import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubit/game_state.dart';
import 'package:hangman/models/word.dart';

/// {@template game_cubit}
/// A simple [Cubit] that manages `GameState` as its state.
/// {@endtemplate}
class GameCubit extends Cubit<GameState> {
  /// {@macro game_cubit}
  GameCubit() : super(GameState(chosenLetters: [], tries: 0));

  void addLetter(String l, Word word) {
    final isLetterOfWord =
        word.getLetters().map((l) => l.toUpperCase()).contains(l.toUpperCase());
    final tryInt = isLetterOfWord ? 0 : 1;
    if (!state.chosenLetters.contains(l)) {
      emit(GameState(
          chosenLetters: List.of(state.chosenLetters)..add(l),
          tries: state.tries += tryInt));
    }
  }

  List<String> getChosenLetters() {
    return state.chosenLetters;
  }

  int getNumberOfChosenLetters() {
    return state.chosenLetters.length;
  }

  bool hasBeenChosen(String l) {
    return state.chosenLetters.contains(l);
  }

  int getTries() {
    return state.tries;
  }

  void reset() {
    emit(GameState(chosenLetters: [], tries: 0));
  }
}
