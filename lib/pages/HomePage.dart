import 'package:flutter/material.dart';

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
      body: Center(
        child: Image(
          image: AssetImage('assets/images/the-battle-logo.png'),
          width: 200,
        ),
      ),
    );
  }
}
