import 'package:projet/models/Character.dart';
import 'package:projet/models/Player.dart';

class Team {
  String uuid;
  Player player;
  List<Character> characters;

  Team(String uuid, Player player, List<Character> characters) {
    this.uuid = uuid;
    this.player = player;
    this.characters = characters;
  }
}
