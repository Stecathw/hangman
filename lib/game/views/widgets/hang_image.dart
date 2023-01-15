import 'package:flutter/material.dart';

Widget hangImage(bool visible, String path) {
  return Visibility(
      visible: visible,
      child: SizedBox(
        width: 250,
        height: 250,
        child: Image.asset(path),
      ));
}

// TODO : refactor and use below in page view
// body: Column(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Center(
//       child: Stack(
//         children: [
//           figureImage(Game.tries >= 0, "assets/hang.png"),
//           figureImage(Game.tries >= 1, "assets/head.png"),
//           figureImage(Game.tries >= 2, "assets/body.png"),
//           figureImage(Game.tries >= 3, "assets/ra.png"),
//           figureImage(Game.tries >= 4, "assets/la.png"),
//           figureImage(Game.tries >= 5, "assets/rl.png"),
//           figureImage(Game.tries >= 6, "assets/ll.png"),
//         ],
//       ),
//     ),
