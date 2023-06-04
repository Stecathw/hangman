// Classe correspondant au mot qui sera à deviner et qui sera split dans la game_page
// On pourra y ajouter une définition servant d'indice au joueur
class Word {
  final String word;

  Word({
    required this.word,
  });

  List<String> getLetters() {
    return word.split('');
  }
}
