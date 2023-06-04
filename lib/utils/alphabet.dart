const int _asciiUpperCaseA = 65;
const int _asciiUpperCaseZ = 90;

List<String> generateAlphabet() {
  final List<String> alphabet = [];

  for (var i = _asciiUpperCaseA; i <= _asciiUpperCaseZ; i++) {
    alphabet.add(String.fromCharCode(i));
  }

  return alphabet;
}

final List<String> letters = generateAlphabet();
