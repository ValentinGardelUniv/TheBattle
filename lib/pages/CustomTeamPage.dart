import 'package:flutter/material.dart';
import 'package:projet/models/Shield.dart';
import 'package:projet/models/ShieldIcon.dart';
import 'package:projet/models/Team.dart';
import 'package:projet/widgets/CustomScaffold.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class CustomTeamPage extends StatefulWidget {
  final Team team;

  CustomTeamPage({Key key, @required this.team}) : super(key: key);

  @override
  _CustomTeamPageState createState() => _CustomTeamPageState();
}

class _CustomTeamPageState extends State<CustomTeamPage> {
  final _formKey = GlobalKey<FormState>();
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
            },
          ),
        ),
      );
    }
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
              TextFormField(
                onSaved: (value) => {changedName = value},
                decoration: InputDecoration(
                  hintText: "Enter a team name",
                  border: InputBorder.none,
                  labelText: "Team name:",
                  labelStyle: TextStyle(
                    color: Colors.red,
                    fontFamily: "Knewave",
                    fontSize: 20,
                  ),
                  contentPadding: EdgeInsets.all(25),
                ),
                //initialValue: this.widget.team.name,
                validator: (value) {
                  if (value.isEmpty) return "Please enter a valid name";
                  return null;
                },
              ),
              Container(
                height: 400,
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: Shield.shields.length,
                      controller: PageController(viewportFraction: 0.7),
                      onPageChanged: (int index) =>
                          setState(() => _indexShield = index),
                      itemBuilder: (_, i) {
                        return Transform.scale(
                          scale: i == _indexShield ? 1 : 0.9,
                          child: ColorFiltered(
                            colorFilter:
                                ColorFilter.mode(shieldColor, BlendMode.srcIn),
                            child: Image(
                              image: AssetImage(Shield.shields[i].getUrl()),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        );
                      },
                    ),
                    Center(
                      child: ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(shieldIconColor, BlendMode.srcIn),
                        child: Image(
                          image: AssetImage(
                              ShieldIcon.icons[this._indexShieldIcon].getUrl()),
                          width: MediaQuery.of(context).size.width * 0.5 * 0.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: ColorPicker(
                  enableShadesSelection: false,
                  color: shieldColor,
                  onColorChanged: (Color color) =>
                      setState(() => shieldColor = color),
                  width: 44,
                  height: 44,
                  borderRadius: 22,
                  heading: Text(
                    'Select shield color',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subheading: Text(
                    'Select color shade',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              Container(
                height: 400,
                child: Stack(
                  children: [
                    Center(
                      child: ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(shieldColor, BlendMode.srcIn),
                        child: Image(
                          image: AssetImage(
                              Shield.shields[this._indexShield].getUrl()),
                          width: MediaQuery.of(context).size.width * 0.7,
                        ),
                      ),
                    ),
                    PageView.builder(
                      itemCount: ShieldIcon.icons.length,
                      controller: PageController(viewportFraction: 0.5),
                      onPageChanged: (int index) =>
                          setState(() => _indexShieldIcon = index),
                      itemBuilder: (_, i) {
                        return Transform.scale(
                          scale: i == _indexShieldIcon ? 0.7 : 0.4,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                shieldIconColor, BlendMode.srcIn),
                            child: Image(
                              image: AssetImage(ShieldIcon.icons[i].getUrl()),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: ColorPicker(
                  enableShadesSelection: true,
                  color: shieldIconColor,
                  onColorChanged: (Color color) =>
                      setState(() => shieldIconColor = color),
                  width: 44,
                  height: 44,
                  borderRadius: 22,
                  heading: Text(
                    'Select shield icon color',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subheading: Text(
                    'Select color shade',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: validateForm,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
