import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubits/game_cubit.dart';
import 'package:hangman/cubits/game_state.dart';
import 'package:hangman/cubits/word_cubit.dart';
import 'package:hangman/cubits/word_state.dart';
import 'package:hangman/widgets/end_game.dart';
import 'package:hangman/widgets/hang_image.dart';
import 'package:hangman/widgets/keyboard.dart';
import 'package:hangman/utils/colors.dart';
import 'package:hangman/widgets/word_guess.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final wordCubit = context.read<WordCubit>();
      final gameCubit = context.read<GameCubit>();
      wordCubit.getRandomWord();
      gameCubit.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, "/"),
        ),
        title: const Text('A little hangman game'),
        backgroundColor: AppColor.primaryColorRed,
      ),
      body: BlocBuilder<WordCubit, WordState>(
        builder: (context, state) {
          if (state is InitWordState || state is LoadingWordState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ResponseWordState) {
            final word = state.chosenWord;
            return BlocBuilder<GameCubit, GameState>(
                builder: (BuildContext context, state) {
              if (state is PlayGameState) {
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
                    Expanded(child: keyboard(context, word)),
                  ],
                );
              } else if (state is WonGameState) {
                return endGame(context, true, word);
              } else if (state is LostGameState) {
                return endGame(context, false, word);
              }
              return const Text('Nothing to display');
            });
          } else if (state is ErrorWordState) {
            return Center(child: Text(state.error));
          }
          return const Center(child: Text('Nothing to display'));
        },
      ),
    );
  }
}
