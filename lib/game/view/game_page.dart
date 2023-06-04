import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/core/cubits/word_cubit.dart';
import 'package:hangman/core/cubits/word_state.dart';
import 'package:hangman/core/components/custom_app_bar.dart';
import 'package:hangman/core/components/error.dart';
import 'package:hangman/game/widgets/main_game.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
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
