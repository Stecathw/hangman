import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/bloc/game_bloc.dart';
import 'package:hangman/bloc/game_event.dart';
import 'package:hangman/cubits/word_cubit.dart';
import 'package:hangman/cubits/word_state.dart';
import 'package:hangman/widgets/bold_text_field.dart';
import 'package:hangman/widgets/error.dart';
import 'package:hangman/utils/colors.dart';
import 'package:hangman/widgets/main_game.dart';

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
      final gameBloc = context.read<GameBloc>();
      gameBloc.add(ResetGameEvent());
      wordCubit.getRandomWord();
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
        title: boldTextField('A little hangman game...', 20, 2),
        backgroundColor: AppColor.primaryColorRed,
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
