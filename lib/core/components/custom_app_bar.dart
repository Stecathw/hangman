import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/core/cubits/game_cubit.dart';
import 'package:hangman/core/cubits/game_state.dart';
import 'package:hangman/core/cubits/word_cubit.dart';
import 'package:hangman/utils/colors.dart';
import 'package:hangman/core/components/bold_text_field.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final wordCubit = context.watch<WordCubit>();
    final gameCubit = context.watch<GameCubit>();

    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        bool isGameOver = state is WonGameState || state is LostGameState;

        return AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              if (isGameOver) {
                wordCubit.getRandomWord();
                gameCubit.reset();
              }
              Navigator.pop(context);
            },
          ),
          title: boldTextField('A little hangman game...', 20, 2),
          backgroundColor: AppColor.primaryColorRed,
          actions: !isGameOver
              ? [
                  IconButton(
                    icon: const Icon(Icons.refresh, color: Colors.white),
                    onPressed: () {
                      wordCubit.getRandomWord();
                      gameCubit.reset();
                    },
                  ),
                ]
              : null,
        );
      },
    );
  }
}
