import 'package:flutter/material.dart';
import 'package:projet/models/Character.dart';
import 'package:projet/models/Team.dart';
import 'package:projet/widgets/CharacterDetail.dart';
import 'package:projet/widgets/CharacterMaster.dart';

class AllCharactersPage extends StatefulWidget {
  final Team team;

  const AllCharactersPage({Key key, @required this.team}) : super(key: key);

  @override
  _AllCharactersPageState createState() => _AllCharactersPageState();
}

class _AllCharactersPageState extends State<AllCharactersPage> {
  CharacterDetail characterDetail;

  @override
  void setState(fn) {
    if (this.mounted) super.setState(fn);
  }

  void toogleCharacter(Character character) {
    //setState(() {
    this.widget.team.toogleCharacter(character);
    Navigator.pushReplacementNamed(context, "/team");
    //});
  }

  @override
  void initState() {
    characterDetail = CharacterDetail(
      team: this.widget.team,
      toogleCharacter: toogleCharacter,
    );
    super.initState();
  }

  void select(Character character) {
    characterDetail.display(character);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          characterDetail,
          Flexible(child: CharacterMaster(showCharacterDetail: this.select)),
        ],
      ),
    );
  }
}
