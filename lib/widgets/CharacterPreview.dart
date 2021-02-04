import 'package:flutter/material.dart';
import 'package:projet/models/Character.dart';

class CharacterPreview extends StatefulWidget {
  final Character character;
  final Function callback;
  final _characterPreviewState = new _CharacterPreviewState();

  CharacterPreview({Key key, @required this.character, @required this.callback})
      : super(key: key);

  @override
  _CharacterPreviewState createState() => _characterPreviewState;

  void unselect() {
    this._characterPreviewState.unselect();
  }
}

class _CharacterPreviewState extends State<CharacterPreview> {
  bool isSelected = false;

  void unselect() {
    setState(() => this.isSelected = false);
  }

  void select() {
    if (!this.isSelected) {
      this.widget.callback(this.widget);
      setState(() {
        this.isSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.select,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (this.isSelected) ? Colors.red[300] : Colors.red[400],
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
          ],
        ),
      ),
    );
  }
}
