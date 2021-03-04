import 'package:flutter/material.dart';
import 'package:projet/models/Character.dart';
import 'package:projet/models/Team.dart';

class CharacterDetail extends StatefulWidget {
  final _characterDetailState = _CharacterDetailState();
  final Team team;
  final Function toogleCharacter;

  CharacterDetail(
      {Key key, @required this.team, @required this.toogleCharacter})
      : super(key: key);

  void display(Character character) {
    _characterDetailState.display(character);
  }

  @override
  _CharacterDetailState createState() => _characterDetailState;
}

class _CharacterDetailState extends State<CharacterDetail> {
  Character character;

  @override
  void setState(fn) {
    if (this.mounted) super.setState(fn);
  }

  void display(Character character) {
    setState(() => this.character = character);
  }

  Widget getTeamButton() {
    if (!this.character.autoSelected) {
      if (this.character.selected) {
        return Center(
          child: ElevatedButton(
            child: Text("Remove From Team"),
            onPressed: () =>
                setState(() => this.widget.toogleCharacter(this.character)),
          ),
        );
      } else if (Team.MAX_CHARACTER >
          Character.getSelectedCharacters().length) {
        return Center(
          child: ElevatedButton(
            child: Text("Add To Team"),
            onPressed: () =>
                setState(() => this.widget.toogleCharacter(this.character)),
          ),
        );
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    if (this.character != null) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red[100],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            this.getCharacterDetail(),
            this.getTeamButton(),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget getCharacterDetail() {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    this.character.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Knewave",
                      fontSize: 20,
                    ),
                  ),
                  Center(
                    child: Image(
                      image: AssetImage(this.character.image),
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    this.character.cleverness.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Knewave",
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    this.character.strength.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Knewave",
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    this.character.intelligence.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Knewave",
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    this.character.speed.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Knewave",
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
