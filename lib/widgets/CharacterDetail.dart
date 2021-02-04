import 'package:flutter/material.dart';
import 'package:projet/models/Character.dart';

class CharacterDetail extends StatefulWidget {
  final _characterDetailState = _CharacterDetailState();

  CharacterDetail({Key key}) : super(key: key);

  void display(Character character) {
    _characterDetailState.display(character);
  }

  @override
  _CharacterDetailState createState() => _characterDetailState;
}

class _CharacterDetailState extends State<CharacterDetail> {
  Character character;

  void display(Character character) {
    setState(() => this.character = character);
  }

  @override
  Widget build(BuildContext context) {
    if (this.character != null) {
      return Container(
          height: 200,
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
          child: Center(
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
          ));
    } else
      return Container(
          /*
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
        child: Text("No Character selected!"),
        */
          );
  }
}
