import 'package:flutter/material.dart';
import 'package:projet/models/Team.dart';
import 'package:projet/widgets/CustomScaffold.dart';

class CustomTeamPage extends StatefulWidget {
  final Team team;

  CustomTeamPage({Key key, @required this.team}) : super(key: key);

  @override
  _CustomTeamPageState createState() => _CustomTeamPageState();
}

class _CustomTeamPageState extends State<CustomTeamPage> {
  final _formKey = GlobalKey<FormState>();
  String changedName;

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
      this.widget.team.name = changedName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        color: Colors.red[100],
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (value) => {changedName = value},
                  decoration: InputDecoration(
                    labelText: "Team name:",
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontFamily: "Knewave",
                      fontSize: 20,
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                  initialValue: this.widget.team.name,
                  validator: (value) {
                    if (value.isEmpty) return "Please enter a valid name";
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: validateForm,
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
