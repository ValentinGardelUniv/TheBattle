import 'package:flutter/material.dart';
import 'package:projet/models/Team.dart';
import 'package:projet/pages/AllCharactersPage.dart';
import 'package:projet/pages/MyRouter.dart';

class HomePage extends StatefulWidget {
  final Team team;

  HomePage({Key key, @required this.team}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> routes = [
    MyRouter.homeRoute,
    MyRouter.teamRoute,
  ];

  @override
  void setState(fn) {
    if (this.mounted) super.setState(fn);
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index != this._selectedIndex) {
        Navigator.pushReplacementNamed(context, routes[index]);
        this._selectedIndex = index;
      }
    });
  }

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
      ),
      body: AllCharactersPage(
        team: this.widget.team,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Characters",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theater_comedy),
            label: "Team",
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
