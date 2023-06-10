import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/bloc/game_bloc.dart';
import 'package:hangman/models/word.dart';
import 'package:hangman/widgets/letter.dart';

List<Widget> wordToGuess(BuildContext context, Word word) {
  final letters = word.getLetters();
  final chosenLetters = context.read<GameBloc>().getChosenLetters();
  return letters.map((l) {
    final isChosen = chosenLetters.contains(l.toUpperCase());
    return letter(l, !isChosen);
  }).toList();
}
