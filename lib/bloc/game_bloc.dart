import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubits/game_state.dart';
import 'package:hangman/bloc/game_event.dart';
import 'package:hangman/models/word.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final Word chosenWord;
  GameBloc(this.chosenWord) : super(PlayGameState(chosenLetters: [], tries: 0));

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is AddLetterEvent) {
      final String letter = event.letter;
      final tryInt = isLetterInWord(letter, chosenWord) ? 0 : 1;
      final totalTries = state.tries += tryInt;
      yield PlayGameState(
          chosenLetters: List.of(state.chosenLetters)
            ..add(letter.toUpperCase()),
          tries: totalTries);
      if (isLost(totalTries)) {
        yield LostGameState(
            chosenLetters: state.chosenLetters, tries: totalTries);
      } else if (isWordGuessed(chosenWord)) {
        yield WonGameState(
            chosenLetters: state.chosenLetters, tries: totalTries);
      }
    }
    else if (event is ResetGameEvent) {
      reset();
    } else if (event is ReturnGameEvent) {
      stepBack();
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

  void stepBack(){
    emit(PlayGameState(chosenLetters: getChosenLetters(), tries: getTries()));
  }
}
