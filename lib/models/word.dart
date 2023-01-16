// Classe correspondant au mot qui sera à deviner et qui sera split dans la game_page
class Word {
  final String word;

  Word({
    required this.word,
  });

  List<String> getLetters() {
    return word.split('');
  }
}
