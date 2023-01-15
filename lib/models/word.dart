class Word {
  final String word;

  Word({
    required this.word,
  });

  List<String> getLetters() {
    return word.split('');
  }
}
