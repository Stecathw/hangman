import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/game/cubit/game_cubit.dart';
import 'package:hangman/game/cubit/game_state.dart';

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
      final cubit = context.read<GameCubit>();
      cubit.fecthWords();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('A little hangman game')),
      body: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          if (state is InitGameState || state is LoadingGameState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ResponseGameState) {
            final words = state.words;
            return ListView.builder(
              itemCount: words.length,
              itemBuilder: (context, index) {
                final word = words[index];
                return ListTile(title: Text(word.word));
              },
            );
          } else if (state is ErrorGameState) {
            return Center(child: Text(state.error));
          }
          return const Center(child: Text('Nothing to display'));
        },
      ),
    );
  }
}
