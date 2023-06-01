import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubits/game_cubit.dart';
import 'package:hangman/cubits/word_cubit.dart';
import 'package:hangman/cubits/word_state.dart';
import 'package:hangman/widgets/bold_text_field.dart';
import 'package:hangman/widgets/error.dart';
import 'package:hangman/utils/colors.dart';
import 'package:hangman/widgets/main_game.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  void resetAppState(BuildContext context) {
    // Reset the app state here
    final wordCubit = context.read<WordCubit>();
    final gameCubit = context.read<GameCubit>();
    wordCubit.getRandomWord();
    gameCubit.reset();

    // Navigate back to the start page
    Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, "/"),
        ),
        title: boldTextField('A little hangman game...', 20, 2),
        backgroundColor: AppColor.primaryColorRed,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () =>
                resetAppState(context), // Call the resetAppState function
          ),
        ],
      ),
      body: BlocBuilder<WordCubit, WordState>(
        builder: (context, state) {
          if (state is InitWordState || state is LoadingWordState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WordLoadedState) {
            final word = state.chosenWord;
            return mainGame(context, word);
          } else if (state is ErrorWordState) {
            return error(state.error);
          }
          return error('ErrorPage');
        },
      ),
    );
  }
}
