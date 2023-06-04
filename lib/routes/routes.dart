import 'package:flutter/material.dart';
import 'package:hangman/start/view/start_page.dart';
import 'package:hangman/game/view/game_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const StartPage());
      case '/game':
        return MaterialPageRoute(builder: (_) => const GamePage());
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}
