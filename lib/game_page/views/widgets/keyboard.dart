// TODO : create a keyboard

// Rafactor and  use below :
//           //Now let's build the Game keyboard
//           SizedBox(
//             width: double.infinity,
//             height: 250.0,
//             child: GridView.count(
//               crossAxisCount: 7,
//               mainAxisSpacing: 8.0,
//               crossAxisSpacing: 8.0,
//               padding: const EdgeInsets.all(8.0),
//               children: alphabets.map((e) {
//                 return RawMaterialButton(
//                   onPressed: Game.selectedChar.contains(e)
//                       ? null // we first check that we didn't selected the button before
//                       : () {
//                           setState(() {
//                             Game.selectedChar.add(e);
//                             print(Game.selectedChar);
//                             if (!word.split('').contains(e.toUpperCase())) {
//                               Game.tries++;
//                             }
//                           });
//                         },
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4.0),
//                   ),
//                   child: Text(
//                     e,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   fillColor: Game.selectedChar.contains(e)
//                       ? Colors.black87
//                       : Colors.blue,
//                 );
//               }).toList(),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }