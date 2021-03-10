import 'package:flutter/material.dart';
import 'package:projet/models/Character.dart';

class CharacterCustomPreview extends StatefulWidget {
  final Character character;
  final Function removeFromTeam;

  CharacterCustomPreview(
      {Key key, @required this.character, this.removeFromTeam})
      : super(key: key);

  @override
  _CharacterCustomPreviewState createState() => _CharacterCustomPreviewState();
}

class _CharacterCustomPreviewState extends State<CharacterCustomPreview> {
  @override
  void setState(fn) {
    if (this.mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (this.widget.character.autoSelected)
                ? Colors.red[0]
                : Colors.red[300],
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
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage(this.widget.character.image),
                    width: 60,
                  )),
            ),
            Expanded(
              child: Container(
                child: Text(
                  this.widget.character.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Knewave",
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                tooltip: this.widget.character.autoSelected
                    ? "Cannot Remove Autoselected character"
                    : "Remove character",
                onPressed: () =>
                    {this.widget.removeFromTeam(this.widget.character)},
                icon: Icon(
                  this.widget.character.autoSelected
                      ? Icons.lock
                      : Icons.remove_circle,
                  color: Colors.red[100],
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
