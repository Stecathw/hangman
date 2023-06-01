import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubits/game_cubit.dart';
import 'package:hangman/cubits/word_cubit.dart';
import 'package:hangman/services/word_service.dart';
import 'package:hangman/views/start_page.dart';
import 'package:hangman/views/game_page.dart';
import 'package:hangman/repository/word_repository.dart';

Future<void> main() async {
  await dotenv.load(); // Loads .env by default
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wordService = WordService(
      apiKey: dotenv.env['API_KEY']!,
      apiHost: dotenv.env['API_HOST']!,
    );

    final wordRepository = WordRepository(wordService);

    return MultiBlocProvider(
      providers: [
        BlocProvider<WordCubit>(
          create: (context) {
            final wordCubit = WordCubit(wordRepository);
            wordCubit.getRandomWord();
            return wordCubit;
          },
        ),
        BlocProvider<GameCubit>(
          create: (context) {
            final gameCubit = GameCubit();
            gameCubit.reset();
            return gameCubit;
          },
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const StartPage(),
          '/game': (context) => const GamePage(),
        },
      ),
    );
  }
}
