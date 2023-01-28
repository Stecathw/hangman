import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/cubits/game_cubit.dart';
import 'package:hangman/cubits/word_cubit.dart';
import 'package:hangman/views/start_page.dart';
import 'package:hangman/views/game_page.dart';
import 'package:hangman/repository/environment.dart';
import 'package:hangman/repository/word_repository.dart';
import 'package:hangman/cubits/main_cubit_observer.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  await dotenv.load(fileName: Environment.fileName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WordCubit>(
              create: ((context) => WordCubit(WordRepository()))),
          BlocProvider<GameCubit>(create: (context) => GameCubit()),
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const StartPage(),
            '/game': (context) => const GamePage(),
          },
        ));
  }
}
