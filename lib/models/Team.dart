import 'package:projet/models/Character.dart';
import 'package:projet/models/Player.dart';
import 'dart:math';

class Team {
  static const int MAX_CHARACTER = 5;

  bool validated;
  String uuid;
  String name = "My Team";
  Player player;
  List<Character> characters;

  Team(String uuid, Player player) {
    this.uuid = uuid;
    this.player = player;
    this.characters = [];
    this.validated = false;
    this.autoselectRandomCharacter(2);
  }

  void autoselectRandomCharacter(int amount) {
    var rnd = new Random();
    if (amount <= Character.characters.length && amount <= Team.MAX_CHARACTER) {
      for (var i = 0; i < amount; i++) {
        var character =
            Character.characters[rnd.nextInt(Character.characters.length - 1)];
        while (this.characters.contains(character)) {
          character = Character
              .characters[rnd.nextInt(Character.characters.length - 1)];
        }
        character.autoSelected = true;
        character.selected = true;
        this.characters.add(character);
      }
    }
  }

  bool toogleCharacter(Character character) {
    if (this.validated || character.autoSelected) return false;
    if (characters.contains(character)) {
      characters.remove(character);
      character.selected = false;
    } else if (this.characters.length < Team.MAX_CHARACTER) {
      characters.add(character);
      character.selected = true;
    } else
      return false;
    return true;
  }
}
