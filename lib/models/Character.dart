import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:projet/models/Skill.dart';

class Character {
  static List<Character> characters = [
    Character("Han Droid", "001", 0, 4, 4, 4),
    Character("Garbagecol Hector", "002", 5, 1, 1, 5),
    Character("Algo Ritm", "003", 5, 1, 1, 5),
    Character("Foobar Baz", "004", 5, 4, 2, 1),
    Character("Joh Ndoe", "005", 4, 3, 3, 2),
    Character("Rid Mi", "006", 3, 3, 3, 3),
  ];

  String uuid, name, image;
  Skill strength, speed, cleverness, intelligence;

  Character(String name, String uuid, int strength, int speed, int clerverness,
      int intelligence) {
    this.name = name;
    this.uuid = uuid;
    this.image = "assets/characters/character-" + uuid + ".png";
    this.strength = Skill(SkillType.STRENGTH, strength);
    this.speed = Skill(SkillType.SPEED, speed);
    this.cleverness = Skill(SkillType.CLEVERNESS, clerverness);
    this.intelligence = Skill(SkillType.INTELLIGENCE, intelligence);
  }

  static void loadCaharacters() async {
    final myData =
        await rootBundle.loadString("assets/characters/characters.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    //print(csvTable);

    Character.characters = [];
    for (var i = 1; i < csvTable.length; i++) {
      var character = new Character(csvTable[i][0], csvTable[i][1],
          csvTable[i][2], csvTable[i][3], csvTable[i][4], csvTable[i][5]);
      Character.characters.add(character);
    }
  }
}
