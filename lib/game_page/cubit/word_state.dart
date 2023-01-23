import 'package:equatable/equatable.dart';
import 'package:hangman/models/word.dart';

abstract class WordState extends Equatable {
  const WordState();

  @override
  List<Object> get props => [];
}

class InitWordState extends WordState {}

class LoadingWordState extends WordState {}

class ErrorWordState extends WordState {
  final String error;
  const ErrorWordState(this.error);
}

class ResponseWordState extends WordState {
  final List<Word> words;
  final Word chosenWord;
  final List<String> chosenLetters;
  const ResponseWordState(this.words, this.chosenWord,
      {this.chosenLetters = const <String>[]});

  @override
  List<Object> get props => [chosenLetters];
}
