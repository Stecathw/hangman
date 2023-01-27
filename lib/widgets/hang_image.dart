import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubit/game_cubit.dart';
import 'package:hangman/utils/colors.dart';

Widget hangPart(bool visible, String path) {
  return Visibility(
      visible: visible,
      child: SizedBox(
        width: 250,
        height: 250,
        child: Image.asset(path, color: AppColor.primaryColorGrey),
      ));
}

Widget hangState(int tries) {
  return Center(
      child: Stack(
    children: [
      hangPart(tries >= 0, "assets/hang.png"),
      hangPart(tries >= 1, "assets/head.png"),
      hangPart(tries >= 2, "assets/body.png"),
      hangPart(tries >= 3, "assets/ra.png"),
      hangPart(tries >= 4, "assets/la.png"),
      hangPart(tries >= 5, "assets/rl.png"),
      hangPart(tries >= 6, "assets/ll.png"),
    ],
  ));
}

Widget hangImage(BuildContext context) {
  final gameCubit = context.read<GameCubit>();
  final tries = gameCubit.getTries();
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
    child: SizedBox(width: 250, height: 250, child: hangState(tries)),
  );
}
