import 'dart:ui';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hangman/core/cubits/game_cubit.dart';
import 'package:hangman/core/cubits/word_cubit.dart';
import 'package:hangman/core/repository/word_repository.dart';
import 'package:hangman/l10n/l10n.dart';
import 'package:hangman/routes/routes.dart';
import 'package:hangman/core/services/word_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final languageCode = WidgetsBinding.instance.window.locale.languageCode;

        return MultiBlocProvider(
          providers: [
            BlocProvider<WordCubit>(
              create: (context) {
                final wordService = WordService(
                  apiKey: dotenv.env['API_KEY']!,
                  apiHost: dotenv.env['API_HOST']!,
                  languageCode: languageCode,
                );
                final wordRepository = WordRepository(wordService);
                final wordCubit = WordCubit(wordRepository);
                wordCubit.getRandomWord();
                return wordCubit;
              },
            ),
            BlocProvider<GameCubit>(
              create: (context) => GameCubit()..reset(),
            ),
          ],
          child: MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: AppLocalizationsX(context).supportedLocales,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        );
      },
    );
  }
}
