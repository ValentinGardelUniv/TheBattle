import 'package:flutter/material.dart';
import 'package:projet/models/Player.dart';
import 'package:projet/pages/CustomTeamPage.dart';
import 'package:projet/pages/HomePage.dart';
import 'package:projet/pages/TeamPage.dart';

class MyRouter {
  static const String homeRoute = '/';
  static const String teamRoute = '/team';
  static const String customTeamRoute = '/team-custom';
  static final Player player = Player("uuid", "john", "doe", "john@doe.com", 1);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => HomePage(team: player.team), settings: settings);
      case teamRoute:
        return MaterialPageRoute(
            builder: (_) => TeamPage(team: player.team), settings: settings);
      case customTeamRoute:
        return MaterialPageRoute(
            builder: (_) => CustomTeamPage(team: player.team),
            settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
