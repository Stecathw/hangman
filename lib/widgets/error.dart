import 'package:flutter/material.dart';
import 'package:hangman/widgets/bold_text_field.dart';

Widget error(String error) {
  return Center(child: boldTextField(error, 25, 3));
}
