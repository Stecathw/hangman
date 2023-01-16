import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/game_page/cubit/game_state.dart';
import 'package:hangman/repository/word_repository.dart';
import 'dart:math';

class GameCubit extends Cubit<GameState> {
  final WordRepository _repository;
  GameCubit(this._repository) : super(InitGameState());

  Future<void> fetchWords() async {
    emit(LoadingGameState());
    try {
      // Choose between fecthing local words or from the API
      final words = await _repository.getFiveFromLocal();
      final random = new Random();
      final chosenWord = words[random.nextInt(words.length)];
      if (kDebugMode) {
        print(words.map((w) => w.word));
        print(chosenWord.word);
      }
      emit(ResponseGameState(words, chosenWord));
    } catch (err) {
      emit(ErrorGameState(err.toString()));
    }
  }
}
