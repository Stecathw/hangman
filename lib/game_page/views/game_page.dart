import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/game_page/cubit/word_cubit.dart';
import 'package:hangman/game_page/cubit/word_state.dart';
import 'package:hangman/game_page/views/widgets/letter.dart';
import 'package:hangman/game_page/views/widgets/keyboard.dart';
import 'package:hangman/utils/colors.dart';

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
      final cubit = context.read<WordCubit>();
      cubit.getRandomWord();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            final wordToGuess = state.chosenWord;
            final listOfletters = state.chosenLetters;
            // final List<String> selectedLetters = [];
            // final letterUsed = state.selectedChar;
            // keyboard = state.;
            return Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: SizedBox(
                          width: 200,
                          height: 250,
                          child: Image.asset("assets/hang.png"),
                        ),
                      ),
                    ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: wordToGuess
                      .getLetters()
                      .map((e) => letter(
                          e.toUpperCase(),
                          !listOfletters.contains(
                              e.toUpperCase()))) // Hidding non-guessed letters
                      .toList(),
                ),
                Expanded(child: keyboard(context, state)),
              ],
            );
          } else if (state is ErrorWordState) {
            return Center(child: Text(state.error));
          }
          return const Center(child: Text('Nothing to display'));
        },
      ),
    );
  }
}
