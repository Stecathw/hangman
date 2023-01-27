import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubit/word_state.dart';
import 'package:hangman/repository/word_repository.dart';
import 'dart:math';

class WordCubit extends Cubit<WordState> {
  final WordRepository _repository;
  WordCubit(this._repository) : super(InitWordState());

  Future<void> getRandomWord() async {
    emit(LoadingWordState());
    try {
      // Choose between fecthing local words or from the API
      final words = await _repository.getFiveFromLocal();
      final random = new Random();
      final chosenWord = words[random.nextInt(words.length)];
      if (kDebugMode) {
        print(words.map((w) => w.word));
        print(chosenWord.word);
      }
      emit(ResponseWordState(words, chosenWord));
    } catch (err) {
      emit(ErrorWordState(err.toString()));
    }
  }
}
