// TODO : create a keyboard
import 'package:hangman/game/views/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hangman/game/views/utils/alphabet.dart';


// Refactor and  use below :
//Now let's build the Game keyboard

Widget keyboard(){
            // height: 250.0,
            return GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: const EdgeInsets.all(8.0),
              children: letters.map((e) {
                return ElevatedButton(
                  onPressed: (){

                  },
                    //letterSelected.contains(e)
                    //  ? null // we first check that we didn't selected the button before
                    //  : () {
                          // setState(() {
                          //   letterSelected.add(e);
                          //   print(letterSelected);
                          //   if (!word.split('').contains(e.toUpperCase())) {
                          //     Game.tries++;
                          //   }
                          // });
                        //},

                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return AppColor.primaryColorGrey;
                        return null;
                      },
                    ),
                backgroundColor: MaterialStateProperty.all(AppColor.primaryColorRed),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)
                ),
                  // fillColor: Game.selectedChar.contains(e)
                  //     ? Colors.black87
                  //     : Colors.blue,
                )
                ),
                  child: Text(
                    e,
                    style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    ),
                  )
                );
              }).toList(),
            );
  }
