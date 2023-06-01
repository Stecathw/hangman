import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubits/game_cubit.dart';
import 'package:hangman/cubits/word_cubit.dart';

void resetAppState(BuildContext context) {
  final wordCubit = context.read<WordCubit>();
  final gameCubit = context.read<GameCubit>();
  wordCubit.getRandomWord();
  gameCubit.reset();
}
