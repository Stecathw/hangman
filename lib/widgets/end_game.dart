import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/bloc/game_bloc.dart';
import 'package:hangman/models/word.dart';
import 'package:hangman/utils/colors.dart';
import 'package:hangman/widgets/bold_text_field.dart';

Widget endGame(BuildContext context, bool isWon, Word word) {
  final numberOfTries = context.read<GameBloc>().getTries();
  final wordString = word.word.toUpperCase();
  final msg = isWon ? 'Congratulation !' : 'Hanged !';
  final imgPath = isWon ? "assets/hang.png" : "assets/hangman.png";
  return Center(
      child: Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 50),
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
          boldTextField(msg, 40, 3),
          boldTextField('Word : "$wordString"', 25, 3),
          boldTextField('Bad tries : x$numberOfTries', 25, 3)
        ],
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: SizedBox(
            height: 80,
            width: 150,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(AppColor.primaryColorRed),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                child: boldTextField('HOME', 28, 3)),
          )),
    ],
  ));
}
