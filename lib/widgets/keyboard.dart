import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/bloc/game_bloc.dart';
import 'package:hangman/bloc/game_event.dart';
import 'package:hangman/models/word.dart';
import 'package:hangman/widgets/letter.dart';
import 'package:flutter/material.dart';
import 'package:hangman/utils/alphabet.dart';

Widget keyboard(BuildContext context, Word word) {
  final gameBloc = context.read<GameBloc>();
  return Padding(
      padding: const EdgeInsets.fromLTRB(2, 25, 2, 2),
      child: GridView.count(
          crossAxisCount: 7,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(8.0),
          children: letters.map((l) {
            final isChosen = gameBloc.hasBeenChosen(l);
            return Center(
                child: GestureDetector(
                    onTap: () {
                      if (!isChosen) {
                        gameBloc.add(AddLetterEvent(l, word));
                      }
                    },
                    child: letter(l, isChosen)));
          }).toList()));
}
