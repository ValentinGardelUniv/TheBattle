import 'package:flutter/material.dart';
import 'package:projet/models/Character.dart';
import 'package:projet/models/Team.dart';
import 'package:projet/pages/MyRouter.dart';
import 'package:projet/widgets/CharacterPreview.dart';
import 'package:projet/widgets/CustomScaffold.dart';

class TeamPage extends StatefulWidget {
  final Team team;

  TeamPage({Key key, @required this.team}) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  int _selectedIndex = 1;
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

  Widget getTeamAction(context) {
    if (this.widget.team.characters.length < Team.MAX_CHARACTER) {
      String message = "Still " +
          (Team.MAX_CHARACTER - this.widget.team.characters.length).toString() +
          " character(s) to select!";
      return Center(
          heightFactor: 2,
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Knewave",
              fontSize: 20,
            ),
          ));
    } else {
      return Center(
        heightFactor: 2,
        child: ElevatedButton(
          child: Text("Valid Team"),
          onPressed: () => {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Are you sure?"),
                action: SnackBarAction(
                  label: "yes",
                  onPressed: () {
                    this.widget.team.validated = true;
                    Navigator.pushReplacementNamed(
                        context,
                        MyRouter
                            .customTeamRoute); //pushNamed() to enable back button, pushReplacementNamed() to disable it
                  },
                ),
              ),
            )
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        color: Colors.red[400],
        child: Column(
          children: [
            this.getTeamAction(context),
            Flexible(
              child: ListView.builder(
                itemCount: this.widget.team.characters.length,
                itemBuilder: (context, index) {
                  return CharacterPreview(
                      character: Character.getSelectedCharacters()[index]);
                },
              ),
            ),
          ],
        ),
      ),
      selectedIndex: _selectedIndex,
      onItemTapped: _onItemTapped,
    );
  }
}
