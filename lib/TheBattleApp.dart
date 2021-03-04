import 'package:flutter/material.dart';
import 'package:projet/pages/MyRouter.dart';
import 'package:projet/pages/HomePage.dart';

class TheBattleApp extends StatefulWidget {
  @override
  _TheBattleAppState createState() => _TheBattleAppState();
}

class _TheBattleAppState extends State<TheBattleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: MyRouter.generateRoute,
      //initialRoute: MyRouter.homeRoute, //enabling this bring back the back button
      home: HomePage(team: MyRouter.player.team),
      title: "The Battle",
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
