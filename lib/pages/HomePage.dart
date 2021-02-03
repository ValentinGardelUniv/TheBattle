import 'package:flutter/material.dart';
import 'package:projet/pages/AllCharactersPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "THE BATTLE",
            style: TextStyle(fontFamily: 'Knewave'),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: AllCharactersPage(),
    );
  }
}
