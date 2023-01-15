import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => kDebugMode
      ? ".env"
      : ".env.production"; // for production create .env.production file
  static String get apiKey =>
      dotenv.env['API_KEY'] ?? "Please provide api key in .env file.";
  static String get apiHost =>
      dotenv.env['API_HOST'] ?? "Please provide api host in .env file.";
}
