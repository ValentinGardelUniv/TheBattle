import 'package:flutter/material.dart';
import 'package:projet/models/Team.dart';

class CustomTeamPage extends StatefulWidget {
  final Team team;

  CustomTeamPage({Key key, @required this.team}) : super(key: key);

  @override
  _CustomTeamPageState createState() => _CustomTeamPageState();
}

class _CustomTeamPageState extends State<CustomTeamPage> {
  @override
  void setState(fn) {
    if (this.mounted) super.setState(fn);
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
      body: Container(
        color: Colors.red[400],
        child: Center(
          child: Text("To Implement"),
        ),
      ),
    );
  }
}
