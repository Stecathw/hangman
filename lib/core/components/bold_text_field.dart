import 'package:flutter/material.dart';

Widget boldTextField(String string, double fontSize, double letterSpacing) {
  return Text(
    string.toUpperCase(),
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
    ),
  );
}
