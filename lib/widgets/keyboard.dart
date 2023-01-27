import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubit/game_cubit.dart';
import 'package:hangman/models/word.dart';
import 'package:hangman/widgets/letter.dart';
import 'package:flutter/material.dart';
import 'package:hangman/utils/alphabet.dart';

Widget keyboard(BuildContext context, Word word) {
  final gameCubit = context.read<GameCubit>();
  return GridView.count(
      crossAxisCount: 7,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(8.0),
      children: letters.map((l) {
        final isChosen = gameCubit.hasBeenChosen(l);
        return Center(
            child: GestureDetector(
                onTap: () {
                  if (!isChosen) {
                    gameCubit.addLetter(l, word);
                    // gameCubit.getChosenLetters();
                  }
                },
                child: letter(l, isChosen)));
      }).toList());
}
