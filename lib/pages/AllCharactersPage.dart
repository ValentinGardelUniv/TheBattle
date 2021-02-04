import 'package:flutter/material.dart';
import 'package:projet/widgets/CharacterDetail.dart';
import 'package:projet/widgets/CharacterMaster.dart';
import 'package:projet/widgets/CharacterPreview.dart';

class AllCharactersPage extends StatelessWidget {
  static CharacterPreview characterPreview;
  final CharacterDetail characterDetail = CharacterDetail();

  void select(CharacterPreview preview) {
    if (characterPreview != null) {
      characterPreview.unselect();
    }
    characterPreview = preview;
    characterDetail.display(preview.character);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(children: [
        characterDetail,
        Expanded(child: CharacterMaster(callback: this.select)),
      ]),
    );
  }
}
