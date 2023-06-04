import 'package:flutter/material.dart';
import 'package:hangman/utils/colors.dart';

Widget letter(String character, bool hidden) {
  return Container(
    height: 65,
    width: 50,
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: !hidden ? AppColor.primaryColorRed : AppColor.primaryColorGrey,
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Visibility(
        visible: !hidden,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            character.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        )),
  );
}
