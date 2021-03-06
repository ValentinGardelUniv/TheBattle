import 'package:flutter/material.dart';
import 'package:projet/models/Character.dart';
import 'package:projet/models/Team.dart';
import 'package:projet/pages/MyRouter.dart';
import 'package:projet/widgets/Character/CharacterCustomPreview.dart';
import 'package:projet/widgets/Custom/CustomScaffold.dart';
import 'package:projet/widgets/Custom/CustomText.dart';

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
          " character(s) to add!";
      return Center(
          heightFactor: 2,
          child: CustomText(
            message,
            color: Colors.yellow,
          ));
    } else {
      return Center(
        heightFactor: 2,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[400]),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
          ),
          child: Text(
            "Validate My Team",
            style: TextStyle(
              fontFamily: "Knewave",
              fontSize: 20,
            ),
          ),
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

  void removeFromTeam(Character character) {
    setState(() {
      this.widget.team.toogleCharacter(character);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "My Team",
      body: Container(
        color: Colors.red[400],
        child: Column(
          children: [
            this.getTeamAction(context),
            Flexible(
              child: ListView.builder(
                itemCount: this.widget.team.characters.length,
                itemBuilder: (context, index) {
                  return CharacterCustomPreview(
                    character: Character.getSelectedCharacters()[index],
                    removeFromTeam: this.removeFromTeam,
                  );
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
