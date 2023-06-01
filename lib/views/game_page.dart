import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubits/word_cubit.dart';
import 'package:hangman/cubits/word_state.dart';
import 'package:hangman/utils/reset_app_state.dart';
import 'package:hangman/widgets/app_bar.dart';
import 'package:hangman/widgets/error.dart';
import 'package:hangman/widgets/main_game.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onBackPressed: () => Navigator.pop(context),
          onResetPressed: () => resetAppState(context)),
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
