import 'package:flutter/material.dart';
import 'package:projet/models/Character.dart';

class CharacterPreview extends StatelessWidget {
  final Character character;
  final bool is_selected = false;

  CharacterPreview({Key key, @required Character character})
      : character = character,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {print("character tapped!")},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (is_selected) ? Colors.red[300] : Colors.red[400],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
                width: 120,
                margin: EdgeInsets.all(15),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(this.character.image),
                  width: 60,
                )),
            Container(
              child: Text(
                character.name,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Knewave",
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
