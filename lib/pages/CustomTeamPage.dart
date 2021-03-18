import 'package:flutter/material.dart';
import 'package:projet/models/Shield.dart';
import 'package:projet/models/ShieldIcon.dart';
import 'package:projet/models/Team.dart';
import 'package:projet/widgets/Custom/CustomScaffold.dart';
import 'package:projet/widgets/Shield/ShieldMaster.dart';
import 'package:projet/widgets/ShieldIcon/ShieldIconMaster.dart';

class CustomTeamPage extends StatefulWidget {
  final Team team;

  CustomTeamPage({Key key, @required this.team}) : super(key: key);

  @override
  _CustomTeamPageState createState() => _CustomTeamPageState();
}

class _CustomTeamPageState extends State<CustomTeamPage> {
  final _formKey = GlobalKey<FormState>();
  final double _shieldFraction = 0.7, _shieldIconFraction = 0.5;
  String changedName;
  int _indexShield = 0, _indexShieldIcon = 0;
  Color shieldColor = Colors.black, shieldIconColor = Colors.white;

  @override
  void initState() {
    this.changedName = this.widget.team.name;
    super.initState();
  }

  @override
  void setState(fn) {
    if (this.mounted) super.setState(fn);
  }

  void validateForm() {
    if (_formKey.currentState.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Are you sure?"),
          action: SnackBarAction(
            label: "yes",
            onPressed: () {
              this.widget.team.name = changedName;
              this.widget.team.shield = Shield(
                Shield.shields[this._indexShield].uuid,
                color: this.shieldColor,
                icon: ShieldIcon(
                  ShieldIcon.icons[this._indexShieldIcon].uuid,
                  color: this.shieldIconColor,
                ),
              );
            },
          ),
        ),
      );
    }
  }

  void updateShieldColor(Color color) {
    setState(() {
      this.shieldColor = color;
    });
  }

  void updateShieldImage(int shieldIndex) {
    setState(() {
      this._indexShield = shieldIndex;
    });
  }

  void updateShieldIconColor(Color color) {
    setState(() {
      this.shieldIconColor = color;
    });
  }

  void updateShieldIconImage(int shieldIconIndex) {
    setState(() {
      this._indexShieldIcon = shieldIconIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Team Customization",
      body: Container(
        color: Colors.red[100],
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                child: ShieldMaster(
                  this.updateShieldColor,
                  this.updateShieldImage,
                  this._shieldFraction,
                  this._shieldIconFraction,
                  this._indexShield,
                  this._indexShieldIcon,
                  this.shieldColor,
                  this.shieldIconColor,
                ),
                margin: EdgeInsets.symmetric(vertical: 50),
              ),
              Container(
                child: ShieldIconMaster(
                  this.updateShieldIconColor,
                  this.updateShieldIconImage,
                  this._shieldFraction,
                  this._shieldIconFraction,
                  this._indexShield,
                  this._indexShieldIcon,
                  this.shieldColor,
                  this.shieldIconColor,
                ),
                margin: EdgeInsets.symmetric(vertical: 50),
              ),
              TextFormField(
                onSaved: (value) => {changedName = value},
                decoration: InputDecoration(
                  hintText: "Enter a team name",
                  border: InputBorder.none,
                  labelText: "Team name:",
                  labelStyle: TextStyle(
                    color: Colors.red,
                    fontFamily: "Knewave",
                    fontSize: 25,
                  ),
                  contentPadding: EdgeInsets.all(25),
                ),
                initialValue: this.widget.team.name,
                validator: (value) {
                  if (value.isEmpty) return "Please enter a valid name";
                  return null;
                },
              ),
              Padding(
                child: ElevatedButton(
                  onPressed: validateForm,
                  child: Text("Submit"),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
