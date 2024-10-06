import 'package:flutter/foundation.dart';
import 'character.dart';

class GameState with ChangeNotifier {
  List<Character> _characters = [];
  List<List<Character?>> _formation = List.generate(3, (_) => List.filled(3, null));

  List<Character> get characters => _characters;
  List<List<Character?>> get formation => _formation;

  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }

  void updateFormation(int row, int col, Character? character) {
    _formation[row][col] = character;
    notifyListeners();
  }
}