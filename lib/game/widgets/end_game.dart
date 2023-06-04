import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/core/cubits/game_cubit.dart';
import 'package:hangman/core/models/word.dart';
import 'package:hangman/l10n/l10n.dart';
import 'package:hangman/utils/colors.dart';
import 'package:hangman/utils/reset_app_state.dart';
import 'package:hangman/core/components/bold_text_field.dart';

Widget endGame(BuildContext context, bool isWon, Word word) {
  final numberOfTries = context.read<GameCubit>().getTries();
  final wordString = word.word.toUpperCase();
  final msg = isWon
      ? AppLocalizations.of(context)!.congratulation
      : AppLocalizations.of(context)!.hanged;
  final imgPath = isWon ? 'assets/hang.png' : 'assets/hangman.png';
  final wordToGuessMsg = AppLocalizations.of(context)!.word;
  final numberOftriesMsg = AppLocalizations.of(context)!.tries;

  return Center(
      child: Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
        child: SizedBox(
          width: 250,
          height: 250,
          child: Image.asset(imgPath, color: AppColor.primaryColorGrey),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: [
          boldTextField(msg, 38, 3),
          boldTextField('$wordToGuessMsg : "$wordString"', 25, 3),
          boldTextField('$numberOftriesMsg : x$numberOfTries', 25, 3)
        ],
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SizedBox(
          height: 80,
          width: 150,
          child: GestureDetector(
            onTap: () => resetAppState(context),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.primaryColorRed,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Icon(
                  Icons.replay,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  ));
}
