import 'package:hangman/models/word.dart';

abstract class GameEvent {}

class AddLetterEvent extends GameEvent {
  final Word word;
  final String letter;

  AddLetterEvent(this.letter, this.word);
}

class ResetGameEvent extends GameEvent{}

class ReturnGameEvent extends GameEvent {}
