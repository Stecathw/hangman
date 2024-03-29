import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/core/cubits/game_cubit.dart';
import 'package:hangman/core/models/word.dart';
import 'package:hangman/game/widgets/letter.dart';
import 'package:flutter/material.dart';
import 'package:hangman/utils/alphabet.dart';

Widget keyboardGrid(BuildContext context, Word word) {
  final gameCubit = context.read<GameCubit>();
  return Padding(
      padding: const EdgeInsets.fromLTRB(2, 25, 2, 2),
      child: GridView.count(
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
                      }
                    },
                    child: letter(l, isChosen)));
          }).toList()));
}
