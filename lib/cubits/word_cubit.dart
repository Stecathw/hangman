import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubits/word_state.dart';
import 'package:hangman/repository/word_repository.dart';

class WordCubit extends Cubit<WordState> {
  final WordRepository _repository;

  WordCubit(this._repository) : super(InitWordState());

  Future<void> getRandomWord() async {
    emit(LoadingWordState());
    try {
      final words = await _repository.fetchWords();
      final random = Random();
      final chosenWord = words[random.nextInt(words.length)];
      if (kDebugMode) {
        print(words.map((w) => w.word));
        print(chosenWord.word);
      }
      emit(WordLoadedState(words, chosenWord));
    } catch (err) {
      emit(ErrorWordState(err.toString()));
    }
  }
}
