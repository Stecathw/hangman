import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/game_page/cubit/game_cubit.dart';
import 'package:hangman/start_page/start_page.dart';
import 'package:hangman/game_page/views/game_page.dart';
import 'package:hangman/repository/environment.dart';
import 'package:hangman/repository/word_repository.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((context) => GameCubit(WordRepository())),
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const StartPage(),
            '/game': (context) => const GamePage(),
          },
        ));
  }
}
