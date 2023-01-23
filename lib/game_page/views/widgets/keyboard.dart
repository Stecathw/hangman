import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/game_page/cubit/word_cubit.dart';
import 'package:hangman/game_page/cubit/word_state.dart';
import 'package:hangman/game_page/views/widgets/letter.dart';
import 'package:flutter/material.dart';
import 'package:hangman/utils/alphabet.dart';

Widget keyboard(BuildContext context, WordState state) {
  return GridView.count(
      crossAxisCount: 7,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(8.0),
      children: letters.map((l) {
        return Center(
            child: GestureDetector(
                onTap: () {
                  // selectedLetters.add(l);
                  // print(selectedLetters);
                  context.read<WordCubit>().selectLetter(l);
                  print(context.read<WordCubit>().getSelectedLetters());
                },
                child: letter(l, false)));
      }).toList());
}
