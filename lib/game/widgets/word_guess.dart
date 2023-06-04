import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/core/cubits/game_cubit.dart';
import 'package:hangman/core/models/word.dart';
import 'package:hangman/game/widgets/letter.dart';

List<Widget> wordToGuess(BuildContext context, Word word) {
  final letters = word.getLetters();
  final chosenLetters = context.read<GameCubit>().getChosenLetters();
  return letters.map((l) {
    final isChosen = chosenLetters.contains(l.toUpperCase());
    return letter(l, !isChosen);
  }).toList();
}
