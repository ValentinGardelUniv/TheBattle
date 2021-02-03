import 'package:flutter/material.dart';
import 'package:projet/models/Character.dart';
import 'package:projet/widgets/CharacterPreview.dart';

class CharacterMaster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: Character.characters.length,
        itemBuilder: (context, index) {
          return CharacterPreview(character: Character.characters[index]);
        },
      ),
    );
  }
}
