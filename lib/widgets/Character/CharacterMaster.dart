import 'package:flutter/material.dart';
import 'package:projet/models/Character.dart';
import 'package:projet/widgets/Character/CharacterPreview.dart';

class CharacterMaster extends StatelessWidget {
  final Function showCharacterDetail;

  CharacterMaster({Key key, this.showCharacterDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: Character.characters.length,
        itemBuilder: (context, index) {
          return CharacterPreview(
              character: Character.characters[index],
              showCharacterDetail: this.showCharacterDetail);
        },
      ),
    );
  }
}
