import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hangman/app/app.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.production');
  runApp(const App());
}
