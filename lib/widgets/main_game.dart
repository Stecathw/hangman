import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubits/game_cubit.dart';
import 'package:hangman/cubits/game_state.dart';
import 'package:hangman/models/word.dart';
import 'package:hangman/widgets/end_game.dart';
import 'package:hangman/widgets/error.dart';
import 'package:hangman/widgets/hang_image.dart';
import 'package:hangman/widgets/keyboard_grid.dart';
import 'package:hangman/widgets/word_guess.dart';

Widget mainGame(BuildContext context, Word word) {
  return BlocBuilder<GameCubit, GameState>(
      builder: (BuildContext context, state) {
    switch (state.runtimeType) {
      case PlayGameState:
        return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[hangImage(context)]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: wordToGuess(context, word),
            ),
            Expanded(child: keyboardGrid(context, word)),
          ],
        );
      case LostGameState:
        return endGame(context, false, word);
      case WonGameState:
        return endGame(context, true, word);
      default:
        return error('ErrorPage');
    }
  });
}
