import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubits/game_cubit.dart';
import 'package:hangman/models/word.dart';
import 'package:hangman/utils/colors.dart';

Widget endGame(BuildContext context, bool isWon, Word word) {
  final numberOfTries = context.read<GameCubit>().getTries();
  final wordString = word.word.toUpperCase();
  final msg = isWon ? 'Congratulation !' : 'Hanged !';
  final imgPath = isWon ? "assets/hang.png" : "assets/hangman.png";
  return Center(
      child: Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
        child: SizedBox(
          width: 250,
          height: 250,
          child: Image.asset(imgPath, color: AppColor.primaryColorGrey),
        ),
      ),
      Column(
        // padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            msg,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              letterSpacing: 3,
            ),
          ),
          Text(
            'Word : "$wordString"',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              letterSpacing: 3,
            ),
          ),
          Text(
            'Bad tries : x$numberOfTries',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              letterSpacing: 3,
            ),
          )
        ],
      ),
      // SizedBox(
      //   height: 80,
      //   width: 150,
      //   child: ElevatedButton(
      //     style: ButtonStyle(
      //       backgroundColor:
      //           MaterialStatePropertyAll<Color>(AppColor.primaryColorRed),
      //     ),
      //     onPressed: () {
      //       Navigator.pushNamed(context, "/game");
      //     },
      //     child: const Text(
      //       'REPLAY',
      //       style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 28,
      //         letterSpacing: 3,
      //       ),
      //     ),
      //   ),
      // )
    ],
  ));
}
